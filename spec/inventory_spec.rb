require_relative '../inventory'
require_relative '../magic_item'

RSpec.describe Inventory do
  let(:item) { MagicItem.new("Чарівний меч", 50, 30) }
  let(:inventory) { Inventory.new }

  describe "#add_item" do 
    it "додає предмет до інвентарю" do
      inventory.add_item(item)
      expect(inventory.items).to include(item)
    end
  end

  describe "#list_items" do
    context "коли інвентар порожній" do
      it "повертає повідомлення про порожній інвентар" do
        expect(inventory.list_items).to eq("Інвентар порожній.")
      end
    end

    context "коли є предмети" do
      it "повертає список предметів" do
        inventory.add_item(item)
        expect(inventory.list_items).to include("Чарівний меч")
        expect(inventory.list_items).to include("30 золота")
      end
    end
  end
  
end