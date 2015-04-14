class HideAndSeek::Item
  cattr_accessor :storage, instance_writer: false
  attr_reader :item_name, :user_identifier

  def initialize(item_name, user_identifier)
    @item_name = item_name
    @user_identifier = user_identifier
  end

  def display?
    return false if storage.exists(key_name)
    return true
  end

  def hide
    if storage.set(key_name, Time.current) == "OK"
      return true
    end
    return false
  end

  def unhide
    storage.del(key_name)
  end

  def key_name
    "#{item_name}-#{user_identifier}"
  end

end
