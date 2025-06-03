require_relative 'magic_item'

class ItemGenerator
    def initialize quantity
        @quantity = quantity
        @names = ["Чарівний меч", "Зачарований щит", "Магічний посох", "Чарівна книга", "Зачаровані чоботи", "Магічний амулет"]
    end

    def create_magic_item
        Array.new(@quantity) { MagicItem.new(@names.sample, rand(1..100), rand(10..50)) }
    end
end