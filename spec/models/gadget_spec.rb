require "spec_helper"
describe Gadget do
  describe "whether new gadget has empty name" do

    it "contains name of the gadget" do
      gadget = Gadget.new
      expect(gadget.name).to eq(nil)
    end

  end
end