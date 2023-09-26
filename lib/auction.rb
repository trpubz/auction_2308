require_relative "item"
require_relative "attendee"
require "date"

class Auction
  attr_reader :items, :open

  def initialize
    @date = Date.today
    @items = []
    @open = true
  end

  def date
    "#{@date.day}/#{@date.mon}/#{@date.year}"
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

  def unique_bidders
    @items.flat_map { |item| item.bids.keys }.uniq
  end

  def bidders
    unique_bidders.map(&:name)
  end

  def bidder_info
    bidders = {}
    unique_bidders.each do |bidder|
      bidders[bidder] = {budget: bidder.budget, items: bidder.bid_items}
    end

    bidders
  end

  def close_auction
    @open = false

    @items.sort_by! { |item| item.current_high_bid }.reverse!
    @items.each do |item|
      sorted_bids = item.bids.sort_by { |_, bid| bid }.reverse
      item.bids = sorted_bids

      item.bids.each do |attendee, bid|
        if attendee.budget >= bid
          item.highest_bidder(attendee)
          attendee.budget -= bid
          break
        end
      end
    end

    @items.each_with_object({}) { |item, hsh| hsh[item] = item.winner }
  end
end
