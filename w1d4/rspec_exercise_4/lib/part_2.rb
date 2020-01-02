def proper_factors(n)
    res = []
    i = 1
    while i < n 
        res << i if n % i == 0
        i += 1
    end
    res
end


def aliquot_sum(n)
    res = proper_factors(n)
    res.sum

end

def perfect_number?(num)
    num == aliquot_sum(num)
end


def ideal_numbers(n)
    res = []

    i = 1
    while res.length < n
        res << i if perfect_number?(i)
        i += 1
    end
    res
end