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

    it "can interact with stock method" do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor = Vendor.new("Rocky Mountain Fresh")
      vendor.stock(item1, 30)
      expect(vendor.check_stock(item1)).to eq(30)
      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)
      vendor.stock(item2, 12)
      expect(vendor.check_stock(item2)).to eq(12)
    end
  end

  describe '#stock' do 
    it "can add an item to the inventory hash" do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor = Vendor.new("Rocky Mountain Fresh")
      vendor.stock(item1, 30)
      expect(vendor.inventory).not_to eq({})
      vendor.stock(item1, 25)
      vendor.stock(item2, 12)
      expect(vendor.inventory).to include(item1, item2)
    end
  end



end

