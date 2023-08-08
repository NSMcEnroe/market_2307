class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    v_names = []
    @vendors.each do |vendor|
      v_names << vendor.name
    end
    v_names
  end

  def vendors_that_sell(item)
    selling_vendors = []
    @vendors.each do |vendor, inventory|
      if vendor.inventory.include?(item)
        selling_vendors << vendor
      end
    end
    selling_vendors
  end

  def sorted_item_list
    all_items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        all_items << item.name
      end
    end
    all_items.uniq.sort!
  end

  def total_inventory
    @t_inventory = Hash.new do |hash, key|
      hash[key] = {quantity: 0, vendors: []}
    end
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        @t_inventory[item][:quantity] += amount
        @t_inventory[item][:vendors] << vendor
      end
    end
    @t_inventory
  end

  def overstocked_items
    total_inventory
    o_items = []
    @t_inventory.each do |item, inner_hash|
      if @t_inventory[item][:quantity] >= 50 && @t_inventory[item][:vendors].count >=2
        o_items << item
      end
    end
    o_items
  end
end