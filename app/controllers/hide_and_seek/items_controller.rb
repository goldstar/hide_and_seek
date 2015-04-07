require_dependency "hide_and_seek/application_controller"

module HideAndSeek
  class ItemsController < ApplicationController
    before_filter :set_current_user

    def show
      render :json => [:display => $hide_and_seek.display?(params[:id], @current_user)]
    end

    def update
      if $hide_and_seek.hide(params[:id], @current_user.id)
        render :success => true
      else
        render status: 502
      end
    end
  end
end
