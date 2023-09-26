require_relative "attendee"

class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid)
    @bids[attendee] = bid
    attendee.bid_on_item(self)
  end

  def current_high_bid
    return 0 if @bids == {}
    @bids.max_by { |_, bid| bid }[1]
  end
end
