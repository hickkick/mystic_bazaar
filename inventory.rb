class Inventory
  attr_reader :items

  def initialize(items = [])
    @items = items
  end
    
  def add_item(item)
    @items << item
    puts "Додано #{item.name} до інвентарю."
  end

  def list_items
    if @items.empty?
      "Інвентар порожній."
    else
      "Інвентар: " + @items.map { |item| "#{item.name} (#{item.power}) — #{item.price} золота" }.join(", ")
    end
  end

  def remove_item(index)
    return nil if index < 1 || index > @items.size
    @items.delete_at(index - 1)
  end
end