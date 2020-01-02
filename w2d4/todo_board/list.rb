require_relative 'item'

class List
    attr_accessor :label, :items

    def initialize(label)
        @label = label
        @items = []
    end
    
    def add_item(title, deadline, description = [])
        pin = Item.new(title, deadline, description)
        if Item.valid_date?(deadline)
            @items << pin
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index >= 0 && index < @items.length
            return true
        else
            return false
        end
    end

    def swap(index_1, index_2)
        if !self.valid_index?(index_1) || !self.valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]   
    end

    def print
        @items.each_with_index do |ele, index|
            p "#{index} | #{ele.title}  |  #{ele.deadline}"
        end
    end

    def print_full_item(index)
        item_info = @items[index]
        if self.valid_index?(index)
            puts "#{item_info.title}  #{item_info.deadline}"
            puts "#{item_info.description}"
        end
    end

    def print_priority
        item_info = @items[0]
        if self.valid_index?(0)
            puts "#{item_info.title}  #{item_info.deadline}"
            puts "#{item_info.description}"
        end
    end

    def up(index, amount)
        counter = index
        
        amount.times do |i|
            if self.valid_index?(counter)
                self.swap(counter, counter-1)
                counter -= 1
            end
        end
    end

end
