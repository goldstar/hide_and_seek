require_dependency "hide_and_seek/application_controller"

module HideAndSeek
  class ItemsController < ApplicationController
    before_filter :determine_identifier

    def show
      respond_to do |format|
        format.json {
          render json: [display: $hide_and_seek.display?(params[:id], @id)]
        }
      end
    end

    def update
      respond_to do |format|
        format.json do
          if $hide_and_seek.hide(params[:id], @id)
            render status: 200, json: [true]
          else
            render status: 502, json: [false]
          end
        end
      end

    end

    private
    def determine_identifier
      @id = params[:user_id] || current_user.id
    end

  end
end
