require 'spec_helper'
require './lib/hide_and_seek/item'

describe HideAndSeek::Item do
  before do
    $redis = double(:exists => true, :set => "OK")
  end

  subject{HideAndSeek::Item.new "foo", 1}

  describe "#display?" do
    it "should return true if key exists" do
      allow($redis).to receive(:exists).and_return 1 
      expect(subject.display?).to be true 
    end
    it "should return false if key doesn't exist" do
      allow($redis).to receive(:exists).and_return 0 
      expect(subject.display?).to be false
    end
  end

  describe "#key_name" do
    it "should join the item name and the user identifier" do
      expect(subject.key_name).to eql "foo-1"
    end

  end

  describe "#hide" do
    it "should receive a key with the current time" do
      expect($redis).to receive(:set).with("foo-1", anything())
      subject.hide
    end
    it "should return true if successful" do
      allow($redis).to receive(:set).and_return "OK"
      expect(subject.hide).to be true
    end

    it "should return false if unsuccessful" do
      allow($redis).to receive(:set).and_return "FALSE"
      expect(subject.hide).to be false
    end
  end

  describe "class methods" do
    context "#display?" do
      it "should instantiate an object" do
        expect(HideAndSeek::Item).to receive(:new).with("foo", 1).and_return subject
        HideAndSeek::Item.display?("foo", 1)
      end
      it "should call display" do
        allow(HideAndSeek::Item).to receive(:new).with("foo", 1).and_return subject
        expect(subject).to receive(:display?)
        HideAndSeek::Item.display?("foo", 1)
      end
    end
    context "#hide" do
      it "should instantiate an object" do
         expect(HideAndSeek::Item).to receive(:new).with("foo", 1).and_return subject
        HideAndSeek::Item.hide("foo", 1)
      end
      it "should call hide" do
        allow(HideAndSeek::Item).to receive(:new).with("foo", 1).and_return subject
        expect(subject).to receive(:hide)
        HideAndSeek::Item.hide("foo", 1)
      end
    end
  end
end
