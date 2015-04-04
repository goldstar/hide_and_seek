class HideAndSeek::Item

  def initialize(item_name, user_identifier)
    @item_name = item_name
    @user_identifier = user_identifier
  end

  def display?
    return true if $redis.exists(key_name) == 1
    return false
  end

  def hide
    if $redis.set(key_name, Time.now) == "OK"
      return true
    end
    return false
  end

  def key_name
    "#{@item_name}-#{@user_identifier}"
  end


end
