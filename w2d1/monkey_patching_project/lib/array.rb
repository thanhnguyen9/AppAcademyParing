# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0 
        self.max - self.min
    end

    def average
        if self.length == 0 
            return nil 
        else
            self.sum / (self.length * 1.0 )
        end
    end

    def median
        return nil if self.length == 0
        if self.length % 2 != 0 
            i = self.length / 2
            self.sort[i]
        else
            #[1,2,3,4]    -->  index = 1,2  -->  4 / 2 =  2
            i = self.length / 2
            (self.sort[i] + self.sort[i-1])/ 2.0
        end

    end

    def counts
        counts = Hash.new(0)
        self.each do |el|
            counts[el] += 1
        end
        counts
    end

    def my_count(char)
        count = 0
        self.each do |el|
            count += 1 if el == char
        end
        count
    end

    def my_index(char)
        return nil if !self.include?(char)
        self.each_with_index do |el, i|
            if el == char
                return i
            end
        end
    end

    def my_uniq
        new = []
        self.each do |el|
            if !new.include?(el)
                new << el
            end
        end
        new
    end

    def my_transpose
        new = []
        (0...self.length).each do |row|
            temp = []
            (0...self.length).each do |col|
                temp << self[col][row]
            end
            new << temp
        end
        new
    end

end



