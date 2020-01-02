def element_count(arr)
    hash = Hash.new(0)

    arr.each do |el|
        hash[el] += 1
    end
    hash
end

def char_replace!(str,hash)
    arr = str.split("")
    
    arr.each_with_index do |letter, i|
        
        if hash.has_key?(letter)
            str[i] = hash[letter]
            # p arr[i]
        end       
    end
    str
end
# string_1 = "hello world"
# p char_replace!(string_1, {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"})
# # expect(string_1).to eq("ha77q-wqr7d")
# string_2 = "pizza"
# char_replace!(string_2, {"z"=>"x", "t"=>"f", "e"=>"a"})
#     #   expect(string_2).to eq("pixxa")

def product_inject(arr)
    arr.inject { |acc, el| acc * el } 

end