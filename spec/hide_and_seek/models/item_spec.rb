require 'spec_helper'

describe HideAndSeek::Item, :type => :model do
  before do
    $redis = double(:exists => true, :set => "OK")
  end

  subject{HideAndSeek::Item.new $redis}

  describe "#display?" do
    it "should return true if key exists" do
      allow($redis).to receive(:exists).with("foo-1").and_return 1 
      expect(subject.display?("foo", 1)).to be true 
    end
    it "should return false if key doesn't exist" do
      allow($redis).to receive(:exists).with("foo-1").and_return 0 
      expect(subject.display?("foo", 1)).to be false
    end
  end

  describe "#key_name" do
    it "should join the item name and the user identifier" do
      subject.item_name = "foo"
      subject.user_identifier = 1
      expect(subject.key_name).to eql "foo-1"
    end

  end

  describe "#hide" do
    it "should receive a key with the current time" do
      expect($redis).to receive(:set).with("foo-1", anything())
      subject.hide("foo", 1)
    end
    it "should return true if successful" do
      allow($redis).to receive(:set).with("foo-1", anything()).and_return "OK"
      expect(subject.hide("foo", 1)).to be true
    end

    it "should return false if unsuccessful" do
      allow($redis).to receive(:set).and_return "FALSE"
      expect(subject.hide("foo", 1)).to be false
    end
  end
end
