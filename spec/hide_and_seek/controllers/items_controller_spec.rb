require 'spec_helper'

describe HideAndSeek::ItemsController, :type => :controller do
  routes { HideAndSeek::Engine.routes }

  let(:current_user){double("User", :id => 1)}

  before do
    $hide_and_seek = double(HideAndSeek)
    allow(controller).to receive(:current_user).and_return(current_user)
  end




  context "#show" do
    it "should check hide_and_seek with the id and the current user" do
      expect($hide_and_seek).to receive(:display?).with("foo", 1).and_return(true)
      get :show, id: "foo"
    end

    it "should render json display => true if successful" do
      allow($hide_and_seek).to receive(:display?).and_return true
      expect(response.body).to eq([display: true].to_json)
      get :show, id: "foo", format: "json"
    end
    
    it "should render json display => false if unsuccessful" do
      allow($hide_and_seek).to receive(:display?).and_return false
      expect(response.body).to eq([display: false].to_json)
      get :show, id: "foo", format: "json"
    end
  end

  context "#update" do
    it "should hide the item for the current_user"
    it "should render 200"

  end
end
