require_relative "player"
require_relative "shop"
require_relative "item_generator"
require_relative "save_load"


loot = ItemGenerator.new(5).create_magic_item
start = Shop.new(loot) 
player = Player.new
#start.list_items
#player.buy(start, 2)
#p player.show

loop do
  puts "\n--- Магазин ---"
  start.list_items
  puts "Введи номер предмета для покупки або 0 для виходу:"
  print "> "
  choice = gets.to_i

  break if choice == 0

  if choice > 0 && choice <= loot.size
    player.buy(start, choice)
    puts player.show
  else
    puts "Невірний вибір. Спробуй ще раз."
  end

  puts "\nПродовжуємо покупки..."
end

puts "\nДякуємо за покупки!"
puts player.show


