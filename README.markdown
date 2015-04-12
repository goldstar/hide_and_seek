#Hide and Seek
### The easiest way to let users "hide this"

##Installation
Install the hide_and_seek gem and then mount it in your routes file:
```
Rails.application.routes.draw do
  mount HideAndSeek::Engine => "/hide_and_seek"
end

```
Create a rails initializer (config/initializers/hide_and_seek.rb) and initialize a new HideAndSeek::Item with a redis instance. This is not namespaced by default, so I highly reccomend using the redis-namespace gem to give it one.

```
$redis = Redis.new
$ns = Redis::Namespace.new("hide-and-seek-#{Rails.env}", :redis => $redis)  
$hide_and_seek = HideAndSeek::Item.new($ns)
```

##Basic Usage
You can use HideAndSeek two ways:
```
$hide_and_seek.display?(unique-key, unique-user-id)
```
The key should be the name of the feature, or message you want to hide. The unique user id could be any way to identify a user, including a cookie id or any repeatable way to identify a specific user.

This returns true or false, depending on if a key is set for that combination of key and user id.

To set the key, use #hide
```
$hide_and_seek.hide(unique-key, unique-user-id)
```
This returns true if redis returns a successful save, false otherwise.

## Controller
Most of the time you'll want to hide things with an ajax request, and sometimes you'll even want to check display that way.

To check for display via ajax:
```
GET /hide_and_seek/items?id=some-key
```
To hide something via ajax:
```
PATCH /hide_and_seek/items?id=some-key
```
Unless a `user_id` is sent as a parameter, the engine's controller will assume a `current_user` method is available and attempt to call `#id` on it. The controller inherits from the parent rails application's `ApplicationController`, so the easiest way is to define a `current_user` method in your `ApplicationController` and let it use that.

###Copyright

Copyright © 2015 Goldstar Events Inc. See LICENSE for details.
