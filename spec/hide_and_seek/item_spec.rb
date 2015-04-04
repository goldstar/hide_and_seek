require 'spec_helper'
require './lib/hide_and_seek/item'

describe HideAndSeek::Item do
  before do
    $redis = double()
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

  describe "generating a key name" do
    it "should join the item name and the user identifier" do
      expect(subject.key_name).to eql "foo-1"
    end

  end
end
