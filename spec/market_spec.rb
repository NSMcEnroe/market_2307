require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before (:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
  end

  describe "#initialize" do
    it "can initialize and return attributes" do
      empty_market = Market.new("South Pearl Street Farmers Market")
      expect(empty_market).to be_a Market
      expect(empty_market.name).to eq("South Pearl Street Farmers Market")
      expect(empty_market.vendors).to eq([])
    end
  end

  describe '#add_vendors' do
    it "can add vendors to a market" do
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe '#vendor_names' do
    it "can display the vendor names in a market" do
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do
    it "can return which vendors have a certain item" do
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end

  describe '#sorted_item_list' do
    it "can return the names of all items within the market" do
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
      item5 = Item.new({name: "Apple", price: "$5.30"})
      item6 = Item.new({name: "Peanut Butter", price: "$4.25"})
      @vendor2.stock(item5, 25)
      expect(@market.sorted_item_list).to eq(["Apple", "Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe '#total_inventory' do
    it "can return the total inventory of the market" do
      expect(@market.total_inventory).not_to eq({})
    end
  end

  describe '#overstocked_items' do
    it "can return an array of items if it meets certain conditions" do
      expect(@market.overstocked_items).to eq([@item1])
    end
  end
end