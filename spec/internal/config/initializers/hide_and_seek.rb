require 'redis'
require 'redis-namespace'

$redis = Redis.new
$ns = Redis::Namespace.new("hide-and-seek-#{Rails.env}", :redis => $redis)
$hide_and_seek = HideAndSeek::Item.new($ns)
