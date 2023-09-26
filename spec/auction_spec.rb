require "spec_helper"

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
  end

  describe "#init" do
    it "exists" do
      expect(@auction).to be_a Auction
    end
  end
end