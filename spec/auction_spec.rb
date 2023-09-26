require "spec_helper"

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
    @auction.add_item(@item1)
    @auction.add_item(@item2)
  end

  describe "#init" do
    it "exists" do
      expect(@auction).to be_a Auction
    end
  end

  describe "#add_item" do
    it "adds items to @items" do
      expect(@auction.items).to eq [@item1, @item2]
    end
  end

  describe "#item_names" do
    it "gets item names from objects" do
      expect(@auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
    end
  end
end