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
  puts "\n--- Меню ---"
  puts "1. Переглянути магазин"
  puts "2. Купити предмет"
  puts "3. Продати предмет"
  puts "4. Переглянути інвентар"
  puts "0. Вийти"

  print "> "
  choice = gets.to_i

  case choice
  when 1
    start.list_items
  when 2
    puts "Введи номер предмета для покупки:"
    start.list_items
    print "> "
    buy_choice = gets.to_i
    player.buy(start, buy_choice)
  when 3
    puts "Введи номер предмета для продажу:"
    puts player.inventory.list_items
    print "> "
    sell_choice = gets.to_i
    player.sell(start, sell_choice)
  when 4
    puts player.show
  when 0
    break
  else
    puts "Невідома команда."
  end
end


puts "\nДякуємо за покупки!"
puts player.show

puts "Зберегти гру? (y/n)"
print "> "
SaveLoad.save_game(player, start) if gets.chomp.downcase == "y"
puts "До зустрічі в наступній грі!"