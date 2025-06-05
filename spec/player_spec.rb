require_relative '../player'
require_relative '../shop'
require_relative '../magic_item' 

RSpec.describe Player do
    let(:item) { MagicItem.new("Чарівний меч", 10, 30) }
    let(:shop) { Shop.new([item]) }

    context "коли в гравця досить золота" do
    let(:player) { Player.new(100) }

    it "купує предмет і зменшує золото" do
      player.buy(shop, 1)
      expect(player.inventory.items).to include(item)
      expect(player.gold).to eq(70)
    end
    end

  context "коли золота недостатньо" do
    let(:player) { Player.new(10) }

    it "не купує і повертає предмет у магазин" do
      player.buy(shop, 1)
      expect(player.inventory.items).not_to include(item)
      expect(shop.items).to include(item)
      expect(player.gold).to eq(10)
    end
  end
end