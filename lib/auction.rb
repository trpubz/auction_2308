require_relative "item"
require_relative "attendee"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map(&:name)
  end

  def unpopular_items
    @items.select { |item| item.bids == {} }
  end
  
  def potential_revenue
    @items.reduce(0) { |tot, item| tot + item.current_high_bid }
  end
end
