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
end