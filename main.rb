require_relative "player"
require_relative "shop"
require_relative "item_generator"
require_relative "save_load"


puts "Завантажити гру? (y/n)"
print "> "
if gets.chomp.downcase == "y" && !SaveLoad.load_game.nil?
  gold, inv_items, shop_items = SaveLoad.load_game
  player = Player.new(gold, inv_items)
  start = Shop.new(shop_items)
else
  puts "Створюємо нову гру..."
  loot = ItemGenerator.new(5).create_magic_item
  start = Shop.new(loot)
  player = Player.new
end

loop do
  puts "\n--- Магазин ---"
  start.list_items
  puts "Введи номер предмета для покупки або 0 для виходу:"
  print "> "
  choice = gets.to_i

  break if choice == 0
  if choice > 0 && choice <= start.items.size
    player.buy(start, choice)
    puts player.show
  else
    puts "Невірний вибір. Спробуй ще раз."
  end

  puts "\nПродовжуємо покупки..."
end

puts "\nДякуємо за покупки!"
puts player.show

puts "Зберегти гру? (y/n)"
print "> "
SaveLoad.save_game(player, start) if gets.chomp.downcase == "y"
puts "До зустрічі в наступній грі!"