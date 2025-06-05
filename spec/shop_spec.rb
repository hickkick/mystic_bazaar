require_relative "../shop"
require_relative "../magic_item"

RSpec.describe Shop do
  let(:item1) { MagicItem.new("Меч", 10, 30) }
  let(:item2) { MagicItem.new("Щит", 5, 20) }
  let(:shop) { Shop.new([item1, item2]) }

  describe "#sell" do
    it "продає товар і видаляє його" do
      sold_item = shop.sell(1)
      expect(sold_item).to eq(item1)
      expect(shop.items).not_to include(item1)
    end
  end

  describe "#return_item" do
    it "додає товар назад" do
      shop.sell(1)
      shop.return_item(item1)
      expect(shop.items).to include(item1)
    end
  end
end
