def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def nth_prime(n)
    res = []
    i = 2
    while res.length < n
        res << i if is_prime?(i)
        i += 1
    end
    res[-1]

end


def prime_range(num1, num2)
    result = []
    min = [num1, num2].min
    max = [num1, num2].max
    i = min 
    while i <= max 
        result << i if is_prime?(i)
        i += 1
    end
    result
end


