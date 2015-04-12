#Hide and Seek
### The easiest way to let users "hide this"

##Installation
Install the hide_and_seek gem and then mount it in your routes file:
```
Rails.application.routes.draw do
  mount HideAndSeek::Engine => "/hide_and_seek"
end

```
Create a rails initializer (config/initializers/hide_and_seek.rb) and initialize a HideAndSeek::Item storage with a redis instance. This is not namespaced by default, so I highly reccomend using the redis-namespace gem to give it one.

```
redis = Redis.new
ns = Redis::Namespace.new("hide-and-seek-#{Rails.env}", :redis => redis)  
HideAndSeek::Item.storage = ns
```

##Basic Usage
You can use HideAndSeek two ways:
```
HideAndSeek::Item.new(unique-key, unique-user-id).display?
```
The key should be the name of the feature, or message you want to hide. The unique user id could be any way to identify a user, including a cookie id or any repeatable way to identify a specific user.

This returns true or false, depending on if a key is set for that combination of key and user id.

To set the key, use #hide
```
HideAndSeek::Item.new(unique-key, unique-user-id).hide
```
This returns true if redis returns a successful save, false otherwise.

You may also include `HideAndSeek::Helpers` to add some convenient helper methods.
```
class ApplicationController
  include HideAndSeek::Helpers

  def display_widget?
    display?('widget', current_user.id)
  end

  def hide_widget
    hide('widget', current_user.id)
  end

  def display_once(item_name)
    if display?(item_name, current_user.id)
      hide(item_name, current_user.id)
      yield if block_given?
    else
      false
    end
  end
end
```

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
