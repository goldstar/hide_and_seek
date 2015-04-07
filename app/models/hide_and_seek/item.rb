class HideAndSeek::Item
  attr_accessor :item_name, :user_identifier

  def initialize(storage)
    @storage = storage
  end

  def display?(item_name, user_identifier)
    @item_name = item_name
    @user_identifier = user_identifier
    return true if $redis.exists(key_name) == 1
    return false
  end

  def hide(item_name, user_identifier)
    @item_name = item_name
    @user_identifier = user_identifier
    if $redis.set(key_name, Time.now) == "OK"
      return true
    end
    return false
  end

  def key_name
    "#{@item_name}-#{@user_identifier}"
  end

end
