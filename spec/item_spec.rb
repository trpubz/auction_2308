require "spec_helper"

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new("")
  end

  describe "#init" do
    it "exists" do
      expect(@item1).to be_a Item
    end
  end
end
