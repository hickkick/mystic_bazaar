require_relative 'inventory'

class Player
  attr_reader :inventory, :gold

  def initialize(gold = 100, inventory_items = [])
    @gold = gold
    @inventory = Inventory.new(inventory_items) 
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
    puts @inventory.list_items
  end

  def inventory_items
    @inventory.items
  end

  def sell(shop, index)
    item = @inventory.remove_item(index)
    return unless item

    refund = (item.price * 0.6).to_i
    @gold += refund
    shop.return_item(item)
    puts "Продано #{item.name} за #{refund} золота. Тепер у тебе #{@gold} золота."
  end

end