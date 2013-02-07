# -*- coding: utf-8 -*-

require 'semaphore-status/version'
require 'open-uri'
require 'json'
require 'time'


class SemaphoreClient

  API_URL = 'https://semaphoreapp.com/api/v1/projects?auth_token='

  def initialize(token)
      response = open(API_URL+token).read
      @json_response = JSON.parse(response)
  end

  def tree(query = nil)
    if query
      projects = search(query)
      if  projects.empty?
        print 'There is no projects with that name.'
        exit
      end
    else
      projects = @json_response
    end

    if @json_response.size == projects.size
      puts 'Your projects on Semaphore:'
    else
      puts "Displaying #{projects.size} of #{@json_response.size} projects:"
    end  

    projects.each_with_index do |project, index|
      if index+1 == projects.size
        print_project(project,'last')
      else
        print_project(project)
      end
    end
  end

  private

  def search(query)
    @json_response.select{|project| project['name'] == query}
  end

  def print_project(project, order = 'first')
    if order == 'last'
      puts "└── #{yellow project['name']}"
      print_branches(project['branches'],'last')
    else
      puts "├── #{yellow project['name']}"
      print_branches(project['branches'])
    end
  end

  def print_branches(branches, order = 'first')
    branches.each_with_index do |branch, index|
      print '|' if order != 'last'
      print '   '
      if index == branches.length - 1
        print_branch(branch, 'last')
      else
        print_branch(branch)
      end
      puts ""
    end
  end

  def print_branch(branch, order = 'first' )
    if order == 'last'
      print "└── "
    else
      print "├── "
    end
    print branch_info(branch)
  end

  def branch_info(branch)
    finished_at = branch['finished_at']
    info = branch['branch_name'].to_s + " :: " + branch['result'].to_s + " (" + branch['build_number'].to_s + ")\e[0m :: " + calculate_time(finished_at)
    if branch['result'] == 'passed'
      green(info)
    elsif branch['result'] == 'failed'
      red(info)
    else
      blue(info)
    end
  end

  def colorize(text, color_code)
    "#{color_code}#{text}\033[0m"
  end

  def red(text); colorize(text, "\e[0;31m"); end
  def green(text); colorize(text, "\e[0;32m"); end
  def blue(text); colorize(text, "\e[0;34m"); end
  def yellow(text); colorize(text, "\e[0;33m"); end

  def calculate_time(finished)
    if finished
      duration(Time.now - Time.parse(finished))
    else
      "Not built yet"
    end
  end

  def duration(time)
    secs  = time.to_int
    mins  = secs / 60
    hours = mins / 60
    days  = hours / 24

    if days > 0
      "#{days} days and #{hours % 24} hours ago"
    elsif hours > 0
      "#{hours} hours and #{mins % 60} minutes ago"
    elsif mins > 0
      "#{mins} minutes and #{secs % 60} seconds ago"
    elsif secs >= 0
      "#{secs} seconds ago"
    end
  end

end