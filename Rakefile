begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
Bundler.require

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'HideAndSeek'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
 
Bundler::GemHelper.install_tasks

require 'combustion'
task :environment do
  Combustion.initialize!
end
Combustion::Application.load_tasks

desc 'Default: run spec tests.'
task :default => :spec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = Dir.glob(['spec/hide_and_seek/**/*'])
  spec.rspec_opts = ['--backtrace']
end

