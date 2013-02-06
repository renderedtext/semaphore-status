# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semaphore-status/version'

Gem::Specification.new do |gem|
  gem.name          = "semaphore-status"
  gem.version       = Semaphore::Status::VERSION
  gem.authors       = ["Aleksandar Diklic"]
  gem.email         = ["aleksandar@renderedtext.com"]
  gem.description   = %q{Command-line interface for checking projects status on Semaphore.}
  gem.summary       = %q{Semaphore status for command-line}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "json"

end
