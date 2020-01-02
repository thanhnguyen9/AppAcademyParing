# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    prime_factor = []
    (2..num).each do |factor|
        if num % factor == 0 && prime(factor)
            prime_factor << factor
        end
    end
    prime_factor[-1]
end


def prime(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def unique_chars?(string)
    hash = Hash.new(0)
    string.each_char do |char|
        hash[char] += 1
    end

    hash.each do |k,v|
        return false if v > 1
    end

    true
end

def dupe_indices(array)
    hash = Hash.new{| h, k | h[k] = []} 
    

    array.each_with_index do |el,idx|
       
        hash[el] << idx
    end
    hash.delete_if {|key,value| value.length <2}
end

def ana_array(array1, array2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    #return false if array1.length != array2.length
    array1.each do |el|
        hash1[el] += 1
    end

    array2.each do |el|
        hash2[el] += 1
    end

    return false if hash1 != hash2
    true
end


