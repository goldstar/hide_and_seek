require 'rubygems'
require 'bundler/setup'
Bundler.setup

require 'redis'
require 'combustion'

Combustion.initialize! :all

require 'rspec/rails'
require 'hide_and_seek'

RSpec.configure do |config|
  $redis   = Redis.new
end
