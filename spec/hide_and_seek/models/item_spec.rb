RSpec.describe HideAndSeek::Item, :type => :model do
  before { described_class.storage = storage }
  after { described_class.storage = nil }
  let(:storage) { double(:exists => true, :set => "OK") }
  subject(:item) { described_class.new('foo', 1) }

  describe "#display?" do
    it "should return false if key exists" do
      allow(storage).to receive(:exists).with("foo-1").and_return true
      expect(item.display?).to be false
    end
    it "should return true if key doesn't exist" do
      allow(storage).to receive(:exists).with("foo-1").and_return false
      expect(item.display?).to be true
    end
  end

  describe "#key_name" do
    it "joins the item_name and user_identifier." do
      expect(described_class.new('foo', 1).key_name).to eq('foo-1')
    end
  end

  describe "#hide" do
    it "should receive a key with the current time" do
      expect(storage).to receive(:set).with("foo-1", anything())
      item.hide
    end
    it "should return true if successful" do
      allow(storage).to receive(:set).with("foo-1", anything()).and_return "OK"
      expect(item.hide).to be true
    end

    it "should return false if unsuccessful" do
      allow(storage).to receive(:set).and_return "FALSE"
      expect(item.hide).to be false
    end
  end

  describe "#unhide" do
    it "should return true if successfully deletes key" do
      expect(storage).to receive(:del).with("foo-1")
      item.unhide
    end
  end
end
