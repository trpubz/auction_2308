require "spec_helper"

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
    @item4 = Item.new("2 Days Dogsitting")
    @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    @attendee2 = Attendee.new({name: "Bob", budget: "$75"})
    @attendee3 = Attendee.new({name: "Mike", budget: "$100"})

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
  end

  describe "#init" do
    it "exists" do
      expect(@item1).to be_a Item
    end

    it "has @name" do
      expect(@item1.name).to eq "Chalkware Piggy Bank"
    end
  end

  describe "#add_bid" do
    it "adds bids" do
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end

  describe "#current_high_bid" do
    it "returns the value of the highest bid" do
      expect(@item1.current_high_bid).to eq 22
    end
  end

  describe "#close_bidding" do
    it "closes bidding and returns highest bid" do
      expect(@item1.close_bidding).to eq 22
      expect { @item1.add_bid("TP", 3377) }.to raise_error FrozenError
    end
  end

  describe "#highest_bidder" do
    it "sets the @winner" do
      @item1.highest_bidder(@attendee1)
      expect(@item1.winner).to eq @attendee1
    end
  end
end
