ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../internal/config/environment.rb",  __FILE__)

require 'rubygems'
require 'bundler/setup'
Bundler.setup

require 'redis'

require 'rspec/rails'

Rails.backtrace_cleaner.remove_silencers!

require 'combustion'
Combustion.initialize! :all

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.disable_monkey_patching!
end

RSpec.configure do |config|
end
