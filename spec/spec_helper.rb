require 'bundler/setup'
Bundler.setup

require 'combustion'
Combustion.initialize! :all

require 'rspec/rails'
require 'redis'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.disable_monkey_patching!
end
