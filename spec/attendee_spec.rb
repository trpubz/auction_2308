require "spec_helper"

RSpec.describe Attendee do
  before(:each) do
    @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    @item1 = Item.new("Chalkware Piggy Bank")
  end

  describe "#init" do
    it "exists" do
      expect(@attendee1).to be_a Attendee
    end

    it "has @name" do
      expect(@attendee1.name).to eq "Megan"
    end

    it "has @budget" do
      expect(@attendee1.budget).to eq 50
    end
  end

  describe "#bid_on_item" do
    it "fills an array of items bid on" do
      @attendee1.bid_on_item(@item1)
      expect(@attendee1.bid_items).to eq [@item1]
    end
  end
end
