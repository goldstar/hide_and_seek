require 'spec_helper'

describe HideAndSeek::ItemsController, :type => :controller do
  routes { HideAndSeek::Engine.routes }

  let(:current_user){double("User", :id => 1)}

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end


  context "#show" do
    it "should check hide_and_seek with the id and the current user" do
      expect($hide_and_seek).to receive(:display?).with("foo", 1).and_return(true)
      get :show, id: "foo", format: :json
    end

    it "should render json display => true if successful" do
      allow($hide_and_seek).to receive(:display?).and_return true
      get :show, id: "foo", format: :json
      expect(response.body).to eq([display: true].to_json)
    end

    it "should render json display => false if unsuccessful" do
      allow($hide_and_seek).to receive(:display?).and_return false
      get :show, id: "foo", format: :json
      expect(response.body).to eq([display: false].to_json)
    end
  end

  context "#update" do
    it "should hide the item for the current_user" do
      expect($hide_and_seek).to receive(:hide).with("foo", 1)
      patch :update, id: "foo", format: :json
    end
    it "should render 200" do
      allow($hide_and_seek).to receive(:hide).and_return true
      patch :update, id: "foo", format: :json
      expect(response.status).to eq(200)
    end
    it "should respond with 502 if it can't be saved." do
      allow($hide_and_seek).to receive(:hide).and_return false
      patch :update, id: "foo", format: :json
      expect(response.status).to eq(502)
    end

  end
end
