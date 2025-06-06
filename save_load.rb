require "json"

class SaveLoad
  SAVE_FILE = "savefile.json"

  def self.save_game(player, shop)
    data = {
      gold: player.gold,
      inventory: player.inventory.items.map(&:to_h),
      shop_items: shop.items.map(&:to_h)
    }

    File.write(SAVE_FILE, JSON.generate(data))
    puts "Гру збережено!"
  end

  def self.load_game
    return nil unless File.exist?(SAVE_FILE)

    data = JSON.parse(File.read(SAVE_FILE), symbolize_names: true)

    inventory_items = data[:inventory].map { |h| MagicItem.from_h(h) }
    shop_items = data[:shop_items].map { |h| MagicItem.from_h(h) }

    return {
      gold: data[:gold],
      inventory: inventory_items,
      shop_items: shop_items
    }
  end
end
