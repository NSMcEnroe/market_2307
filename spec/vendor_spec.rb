require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  describe '#initialize' do
    it "can initialize with all attributes" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      expect(vendor).to be_a Vendor
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it "can determine the amount of stock of a certain item in an inventory" do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor = Vendor.new("Rocky Mountain Fresh")
      expect(vendor.check_stock(item1)).to eq(0)
    end
  end
end

