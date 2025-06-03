class Inventory
    def initialize
        @items = []
    end
    
    def add_item(item)
        @items << item
        puts "Додано #{item.name} до інвентарю."
    end

    def list_items
        if @items.empty?
            "Інвентар порожній."
        else
            "Інвентар: " + @items.map { |item| "#{item.name} (#{item.power}) — #{item.price} золота" }.join(", ")
        end
    end
end