class MagicItem
  attr_reader :name, :power, :price

  def initialize(name, power, price)
    @name = name
    @power = power
    @price = price
  end
end