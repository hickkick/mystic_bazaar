require_relative '../item_generator'
require_relative '../magic_item'

RSpec.describe ItemGenerator do
  let(:item_generator) { ItemGenerator.new(5) }
  
  describe '#create_magic_item' do
    it 'створює масив з магічними предметами з правильними властивостями' do
      items = item_generator.create_magic_item
      expect(items.size).to eq(5)

      items.each do |item|
        expect(item).to be_a(MagicItem)
        expect(item.name).to be_a(String)
        expect(item.name).not_to be_empty
        expect(item.power).to be > 0
        expect(item.price).to be > 0
      end
    end
  end
end