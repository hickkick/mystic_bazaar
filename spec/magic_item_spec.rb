require_relative '../magic_item'

RSpec.describe MagicItem do
  let(:item) { MagicItem.new("меч", 50, 20) }

  it "має ім'я" do
    expect(item.name).to eq("меч")
  end

  it "має силу" do
    expect(item.power).to eq(50)
  end

  it "має ціну" do
    expect(item.price).to eq(20)
  end
end