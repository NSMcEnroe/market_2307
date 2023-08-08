class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    p_r = 0
    @inventory.each do |item, amount|
      p_r += item.price * amount
    end
    p_r
  end



  # def total_revenue
  #   @rider_log.values.sum * @admission_fee
  # end

end