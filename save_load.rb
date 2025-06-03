require "json"

class SaveLoad
  SAVE_FILE = "savefile.json"

  def self.save_game(player, shop)
    data = {
      gold: player.gold,
      inventory: player.inventory.items.map { |item| item_to_hash(item) },
      shop_items: shop.items.map { |item| item_to_hash(item) }
    }

    File.write(SAVE_FILE, JSON.pretty_generate(data))
    puts "Гру збережено!"
  end

  def self.load_game
    return nil unless File.exist?(SAVE_FILE)

    data = JSON.parse(File.read(SAVE_FILE), symbolize_names: true)

    inventory_items = data[:inventory].map { |h| hash_to_item(h) }
    shop_items = data[:shop_items].map { |h| hash_to_item(h) }

    return data[:gold], inventory_items, shop_items
  end

  def self.item_to_hash(item)
    { name: item.name, power: item.power, price: item.price }
  end

  def self.hash_to_item(h)
    MagicItem.new(h[:name], h[:power], h[:price])
  end
end
