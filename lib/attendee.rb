class Attendee
  attr_reader :name, :budget, :bid_items

  def initialize(args)
    @name = args[:name]
    @budget = args[:budget].sub("$", "").to_i
    @bid_items = []
  end

  def bid_on_item(item)
    @bid_items << item
  end
end
