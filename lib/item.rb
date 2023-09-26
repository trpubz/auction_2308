require_relative "attendee"

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
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
end
