class Attendee
  attr_reader :name, :budget

  def initialize(args)
    @name = args[:name]
    @budget = args[:budget].sub("$", "").to_i
  end
end
