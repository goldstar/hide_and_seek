require 'hide_and_seek/helpers'

RSpec.describe HideAndSeek::Helpers, type: :helper do
  let(:storage) { double(exists: true, set: 'OK') }
  before { HideAndSeek::Item.storage = storage }

  describe '#display?' do
    it "instantiates a HideAndSeek::Item with the given item_name and user_identifier" do
      expect(HideAndSeek::Item).to receive(:new).with('foo', 1).and_call_original
      helper.display?('foo', 1)
    end

    it "calls #display? on the HideAndSee::Item instance" do
      expect_any_instance_of(HideAndSeek::Item).to receive(:display?).once.and_call_original
      helper.display?('foo', 1)
    end
  end

  describe '#hide' do
    it "instantiates a HideAndSeek::Item with the given item_name and user_identifier" do
      expect(HideAndSeek::Item).to receive(:new).with('foo', 1).and_call_original
      helper.hide('foo', 1)
    end

    it "calls #hide on the HideAndSee::Item instance" do
      expect_any_instance_of(HideAndSeek::Item).to receive(:hide).once.and_call_original
      helper.hide('foo', 1)
    end
  end
end
