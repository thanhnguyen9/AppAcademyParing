def my_map(arr, &b)
    new_arr = []
    arr.each do  |el|
        new_arr << b.call(el)
    end
    new_arr
end

def my_select(array, &blk)
    newarr = []
    array.each do |el|
        newarr << el if blk.call(el)
    end

    newarr
end

def my_count(arr, &b)

    count = 0 
    arr.each do |el|
        count += 1 if b.call(el)
    end
    count 
end


def my_any?(array, &blk)

    array.each {|el| return true if  blk.call(el)}
    false
end

def my_all?(arr, &b)
    arr.each do |el|
        if !b.call(el)
            return false
        end
    end
    true
end

def my_none?(array, &blk)
    array.each do |el|
        return false if blk.call(el)
    end
    true
end




