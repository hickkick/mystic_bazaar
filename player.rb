require_relative 'inventory'

class Player
  attr_reader :inventory

  def initialize
    @inventory = Inventory.new
    @gold = 100 # Початковий капітал гравця
  end

  def buy(shop, index)
    item = shop.sell(index)
    return unless item

    if @gold >= item.price
        @gold -= item.price
        @inventory.add_item(item) 
        puts "Куплено #{item.name} за #{item.price}. Залишилось #{@gold} золота."
    else
        temp = @gold
        puts "Недостатньо #{item.price - temp} золота для покупки #{item.name}."
        shop.return_item(item)
    end
  end

  def show
    puts "Золото: #{@gold}"
    @inventory.list_items
  end

end