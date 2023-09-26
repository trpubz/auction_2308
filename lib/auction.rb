require_relative "item"
require_relative "attendee"

class Auction
  attr_reader :items

  def initialize
    @items = []
  end
end