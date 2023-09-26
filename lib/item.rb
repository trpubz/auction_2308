require_relative "attendee"

class Item
  attr_reader :name, :winner
  attr_accessor :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
    @winner = "Not Sold"
  end

  def add_bid(attendee, bid)
    raise FrozenError, "Bidding closed; high bid: #{current_high_bid}" unless @open

    @bids[attendee] = bid
    attendee.bid_on_item(self)
  end

  def current_high_bid
    return 0 if @bids == {}
    @bids.max_by { |_, bid| bid }[1]
  end

  def close_bidding
    @open = false
    current_high_bid
  end

  def highest_bidder(attendee)
    @winner = attendee
  end
end
