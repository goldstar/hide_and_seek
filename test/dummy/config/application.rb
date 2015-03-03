require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)
require "hide_and_seek"

module Dummy
  class Application < Rails::Application
  end
end

