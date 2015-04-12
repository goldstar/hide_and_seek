module HideAndSeek
  module Helpers
    # Checks if an item should be displayed for a
    # given user.
    # 
    # @param item_name [String]
    # @param user_identifier [Integer]
    # @return [true, false]
    def display?(item_name, user_identifier)
      HideAndSeek::Item.new(item_name, user_identifier).display?
    end

    # Hides an item for a given user.
    # 
    # @param item_name [String]
    # @param user_identifier [Integer]
    # @return [true, false]
    def hide(item_name, user_identifier)
      HideAndSeek::Item.new(item_name, user_identifier).hide
    end
  end
end
