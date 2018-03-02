require_dependency "hide_and_seek/application_controller"

module HideAndSeek
  class ItemsController < ApplicationController
    def show
      respond_to do |format|
        format.json {
          render json: [display: hide_and_seek.display?]
        }
      end
    end

    def update
      respond_to do |format|
        format.json do
          if hide_and_seek.hide
            render status: 200, json: [true]
          else
            render status: 502, json: [false]
          end
        end
      end
    end

    def hide_and_seek
      @hide_and_seek ||= HideAndSeek::Item.new(params[:item_name], user_identifier)
    end

    private

    def user_identifier
      params[:user_id] || current_user.id
    end
  end
end
