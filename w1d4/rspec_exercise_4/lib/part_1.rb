def my_reject(arr, &b)
    result = []
    arr.each {|el| result << el if !b.call(el)  }
    result
end

def my_one?(arr, &b)
    res = []

    arr.each { |el| res << el if b.call(el) }
    res.length == 1

end

require "byebug"
def hash_select(hash, &prc)
    result = Hash.new(0)
    #debugger  

    hash.each do |k, v|
        if prc.call(k, v)
            result[k] = v
        end
    end
   
    
    result
end

def xor_select(arr, prc1, prc2)
    result = []
    arr.each {|el| result << el if (prc1.call(el) && !prc2.call(el)) || (!prc1.call(el) && prc2.call(el))  }
    result
end


def proc_count(n, arr)
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(n)
    end
    count
end
