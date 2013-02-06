# -*- coding: utf-8 -*-

require "semaphore-status/version"
require "open-uri"


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

      puts '----------------------------------------------------------------'
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
      info = branch['branch_name'].to_s + " :: " + branch['result'].to_s + " (" + branch['build_number'].to_s + ") "
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

    def red(text); colorize(text, "\033[7;30;41m"); end
    def green(text); colorize(text, "\033[7;30;42m"); end
    def blue(text); colorize(text, "\033[7;30;44m"); end
    def yellow(text); colorize text, "\033[7;30;43m"; end
end