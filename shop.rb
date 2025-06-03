class Shop
  def initialize(items)
    @items = items
  end

  def list_items
    puts "Доступні товари:"
    @items.each_with_index do |item, index|
      puts "#{index + 1}. #{item.name} (#{item.power}) — Вартує #{item.price} золота"
    end
  end

  def sell(index)
    @items.delete_at(index - 1)
  end

  def return_item(item)
    @items << item
    puts "Предмет #{item.name} повернуто до магазину."
  end
end