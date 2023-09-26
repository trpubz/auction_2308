require "spec_helper"

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new("Chalkware Piggy Bank")
    @item2 = Item.new("Bamboo Picture Frame")
    @item3 = Item.new("Homemade Chocolate Chip Cookies")
    @item4 = Item.new("2 Days Dogsitting")
    @item5 = Item.new("Forever Stamps")
    @auction.add_item(@item1)
    @auction.add_item(@item2)


    @attendee1 = Attendee.new({name: "Megan", budget: "$50"})
    @attendee2 = Attendee.new({name: "Bob", budget: "$75"})
    @attendee3 = Attendee.new({name: "Mike", budget: "$100"})
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

  context "bidding has started" do
    before do
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
    end

    describe "#add_item" do
      it "adds items to @items" do
        expect(@auction.items).to eq [@item1, @item2, @item3, @item4, @item5]
      end
    end

    describe "#unpopular_items" do
      it "returns items without bids" do
        expect(@auction.unpopular_items).to eq [@item2, @item3, @item5]
        @item3.add_bid(@attendee2, 15)
        expect(@auction.unpopular_items).to eq [@item2, @item5]
      end
    end

    describe "#potential_revenue" do
      it "returns sum of highest bids" do
        @item3.add_bid(@attendee2, 15)
        expect(@auction.potential_revenue).to eq 87
      end
    end

    describe "#unique_bidders" do
      it "returns array of unique bidder objects" do
        expect(@auction.unique_bidders).to eq [@attendee2, @attendee1, @attendee3]
      end
    end

    describe "#bidders" do
      it "returns array of bidder's names" do
        expect(@auction.bidders).to eq %w[Bob Megan Mike]
      end
    end

    describe "#bidder_info" do
      it "returns a hash of attendees with their budgets and bid items" do
        expected = {
          @attendee2 => {budget: 75,
                         items: [@item1]},
          @attendee1 => {budget: 50,
                         items: [@item1]},
          @attendee3 => {budget: 100,
                         items: [@item4]}
        }
        expect(@auction.bidder_info).to eq expected
      end
    end
  end
end
