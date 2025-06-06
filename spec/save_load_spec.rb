require_relative '../save_load'
require_relative '../player'
require_relative '../shop'
require_relative '../magic_item'
require 'json'

RSpec.describe SaveLoad do
  let(:inventory_items) { [MagicItem.new("Чарівний меч", 50, 30)] }
  let(:shop_items) { [MagicItem.new("Магічний щит", 40, 20)] }
  let(:player) { Player.new(100, inventory_items) }
  let(:shop) { Shop.new(shop_items) }

  describe '.save_game' do
    it 'викликає File.write з правильними даними' do
      expected_data = {
        gold: 100,
        inventory: inventory_items.map(&:to_h),
        shop_items: shop_items.map(&:to_h)
      }

      json_string = JSON.generate(expected_data)

      expect(File).to receive(:write).with(SaveLoad::SAVE_FILE, json_string)

      SaveLoad.save_game(player, shop)
    end
  end

  describe '.load_game' do
    it 'читає з файла та повертає розпарсені дані' do
      parsed_data = {
        gold: 100,
        inventory: [ { name: "Чарівний меч", power: 50, price: 30 } ],
        shop_items: [ { name: "Щит", power: 40, price: 20 } ]
      }

      allow(File).to receive(:exist?).with(SaveLoad::SAVE_FILE).and_return(true)
      allow(File).to receive(:read).with(SaveLoad::SAVE_FILE).and_return("json_content")
      expect(JSON).to receive(:parse).with("json_content", symbolize_names: true).and_return(parsed_data)

      result = SaveLoad.load_game
      expect(result[:gold]).to eq(100)
      expect(result[:inventory].map(&:to_h)).to eq([{ name: "Чарівний меч", power: 50, price: 30 }])
      expect(result[:shop_items].map(&:to_h)).to eq([{ name: "Щит", power: 40, price: 20 }])
    end

    it 'повертає nil, якщо файл не існує' do
      allow(File).to receive(:exist?).with(SaveLoad::SAVE_FILE).and_return(false)
      result = SaveLoad.load_game
      expect(result).to be_nil
    end
  end
end
