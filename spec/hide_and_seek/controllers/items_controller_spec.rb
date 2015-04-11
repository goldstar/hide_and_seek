require 'spec_helper'

describe HideAndSeek::ItemsController, :type => :controller do
  routes { HideAndSeek::Engine.routes }

  let(:current_user){double("User")}
  before do
    $hide_and_seek = double(HideAndSeek)
  end
  controller do
    def set_current_user
      @current_user = current_user
    end
  end

  context "#show" do
    it "should have a show route" do
      expect(:get => hide_and_seek.item_path("foo")).
        to route_to(:controller => "hide_and_seek/items", :action => "show")
    end

    it "should check hide_and_seek with the id and the current user" do
      allow(current_user).to receive(:id).and_return 1
      expect($hide_and_seek).to receive(:display?).with("foo").and_return(1)
      get :show, :params => {:id => "foo"}
    end

    it "should render json display => true if successful"
    it "should render json display => false if unsuccessful"
  end

  context "#update" do
    it "should hide the item for the current_user"
    it "should render 200"

  end
end
