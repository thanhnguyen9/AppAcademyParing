class Item
    attr_accessor :title, :description
    attr_reader :deadline
    def self.valid_date?(date_string)
        check = date_string.split("-")
        month_nums = (1..12).to_a
        date_nums = (1..31).to_a

        return false if date_string.length != 10
        return false if !month_nums.include?(check[1].to_i)
        return false if !date_nums.include?(check[2].to_i)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise "invalid date"
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid date"
        end
    end


end

