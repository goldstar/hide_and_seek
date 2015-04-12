RSpec.describe HideAndSeek::ItemsController, :type => :controller do
  routes { HideAndSeek::Engine.routes }

  let(:current_user){ double("User", :id => 1) }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe '#hide_and_seek' do
    before { controller.params.merge!(item_name: 'foo') }

    context 'when a user_id parameter has not been provided' do
      it "instantiates a HideAndSeek::Item for the current user" do
        expect(HideAndSeek::Item).to receive(:new).with('foo', 1)
        controller.hide_and_seek
      end
    end

    context 'when a user_id parameter has been provided' do
      before { controller.params.merge!(user_id: 9001) }

      it "instantiates a HideAndSeek::Item for the requested user" do
        expect(HideAndSeek::Item).to receive(:new).with('foo', 9001)
        controller.hide_and_seek
      end
    end
  end

  describe "#show" do
    it "should check hide_and_seek with the id and the current user" do
      expect_any_instance_of(HideAndSeek::Item).to receive(:display?).and_return(true)
      get :show, item_name: "foo", format: :json
    end

    it "should render json display => true if successful" do
      allow_any_instance_of(HideAndSeek::Item).to receive(:display?).and_return true
      get :show, item_name: "foo", format: :json
      expect(response.body).to eq([display: true].to_json)
    end

    it "should render json display => false if unsuccessful" do
      allow_any_instance_of(HideAndSeek::Item).to receive(:display?).and_return false
      get :show, item_name: "foo", format: :json
      expect(response.body).to eq([display: false].to_json)
    end
  end

  describe "#update" do
    it "should hide the item for the current_user" do
      expect_any_instance_of(HideAndSeek::Item).to receive(:hide)
      patch :update, item_name: "foo", format: :json
    end

    it "should render 200" do
      allow_any_instance_of(HideAndSeek::Item).to receive(:hide).and_return true
      patch :update, item_name: "foo", format: :json
      expect(response.status).to eq(200)
    end

    it "should respond with 502 if it can't be saved." do
      allow_any_instance_of(HideAndSeek::Item).to receive(:hide).and_return false
      patch :update, item_name: "foo", format: :json
      expect(response.status).to eq(502)
    end
  end
end
