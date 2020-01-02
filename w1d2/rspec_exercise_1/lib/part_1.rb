def average(n1, n2)
    (n1 + n2) / 2.0
end

def average_array(array)
    array.sum / ((array.length) *1.0)
end

 def repeat(string, num)
    string * num
 end


 def yell(string)
     string.upcase+"!"
 end

 def alternating_case(sentence)
    newsentence = []
    sentence.split(" ").each_with_index do |word, idx|
        if idx.even?
            newsentence << word.upcase
        else 
            newsentence << word.downcase
        end
    end
    newsentence.join(" ")
 end