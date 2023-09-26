require "spec_helper"

RSpec.describe Attendee do
  before(:each) do
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  end

  describe "#init" do
    it "exists" do
      expect(@attendee1).to be_a Attendee
    end
  end
end