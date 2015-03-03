# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require "minitest/autorun"
require "minitest/spec"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
end

module HideAndSeek::Expectations
  infect_an_assertion :assert_difference, :must_change
  infect_an_assertion :assert_no_difference, :wont_change
end

class Object
  include HideAndSeek::Expectations
end
