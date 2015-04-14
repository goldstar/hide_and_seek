require 'redis'
require 'redis-namespace'

redis = Redis.new(logger: Rails.logger)
ns = Redis::Namespace.new("hide-and-seek-#{Rails.env}", :redis => redis)
HideAndSeek::Item.storage = ns
