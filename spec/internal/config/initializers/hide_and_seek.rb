require 'redis'

$redis = Redis.new
$hide_and_seek = HideAndSeek::Item.new $redis
