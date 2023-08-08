require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  describe '#initialize' do
    it "can initialize with all attributes" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      expect(vendor).to be_a Vendor
      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end
  end
end

