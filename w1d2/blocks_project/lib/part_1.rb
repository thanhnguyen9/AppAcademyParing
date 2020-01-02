def select_even_nums(array)
    array.select {|el| el.even? }
end

def reject_puppies(array)
    array.reject {|dog| dog["age"] < 3}

end


def count_positive_subarrays(array)
    array.count {|sub| sub.sum > 0 }
end



def aba_translate(string)
    vowels = "aeiou"
    string.split("").map.each do |char|
        if vowels.include?(char)
           char + "b" + char 
        else
            char
        end
    end.join("")
end


def aba_array(array)
    array.map { |word| aba_translate(word)}
end

