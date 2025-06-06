class MagicItem
  attr_reader :name, :power, :price

  def initialize(name, power, price)
    @name = name
    @power = power
    @price = price
  end

  def to_h
    { name: name, power: power, price: price }
  end

  def self.from_h(hash)
    new(hash[:name], hash[:power], hash[:price])
  end
end