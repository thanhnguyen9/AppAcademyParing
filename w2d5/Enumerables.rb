require "byebug"

class Array
    
    def my_each(&prc)
        count = 0 
        while count < self.length
            self[count] = prc.call(self[count])
            count += 1
        end
        self  #[]
    end

    
#my_each return for us [...]
    def my_select(&prc)
        result = []
        new_proc = Proc.new { |el|  result << el if prc.call(el)}
        self.my_each(&new_proc)
        result
    end

    def my_reject(&prc)
        result = [] 
        new_proc = Proc.new {|el| result << el if !prc.call(el)}
        self.my_each(&new_proc)
        result
    end

    def my_any?(&prc) 
        new_proc = Proc.new {|el| return true if prc.call(el)}
        self.my_each(&new_proc)
        false
    end

    def my_all?(&prc)
        new_proc = Proc.new {|el| return false if prc.call(el)}
        self.my_each(&new_proc)
        true
    end

    def my_zip(*arrs)
        row = 0
        column =  0
        result = Array.new(self.length) {Array.new(self.length)}
        # debugger
        while column < self.length
            temp = []
            temp << self[column] 
            while row < arrs.length 
                temp << arrs[row][column]
                row += 1
            end
            result[column] = temp
            column += 1 
            row = 0
        end
        result
    end

    def my_rotate(n=1)
        if n > 0
            n.times do
                ele = self.shift
                self << ele
            end
        else
            (n*-1).times do
                ele = self.pop
                self.unshift(ele)
            end
        end
        self
    end

    def my_join(symbol = "")
        new = []
        i =0
        while i < self.length
        self.my_each do |el|
            new << el 

        end
    end

end

# def check(arr, n)
#     n.times do
#         ele = arr.shift
#         arr << ele
#     end
#     arr
#     # ele = arr.shift
#     # # arr.shift
#     # arr << ele
#     # return arr
# end


# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# else
#             (n*-1).times do 
#                 moved = self.pop 
#                 self.pop 
#                 self.unshift(moved)
#             end

