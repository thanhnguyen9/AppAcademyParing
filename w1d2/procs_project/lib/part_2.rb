def reverser(str,&b)

    b.call(str.reverse)
    
end

def word_changer(sentence, &blk)
    newsentence  = []
    sentence.split(" ").each do |word|
        newsentence << blk.call(word)
    end

    newsentence.join(" ")
end

def greater_proc_value(num,proc1, proc2)
    # value_1 = proc1.call(num)
    # value_2 = proc2.call(num)

    # if value_1 > value_2
    #     return value_1
    # else
    #     return value_2
    # end

    (proc1.call(num) > proc2.call(num)) ? proc1.call(num) : proc2.call(num)
    
end



def and_selector(array, prc1, prc2)
    newarray = []
    array.each do |el|
      newarray << el if  prc1.call(el) && prc2.call(el)
    end
    newarray

end

def alternating_mapper(arr,proc1,proc2)
    new_arr =[]
    arr.each_with_index do |el,idx|
        if idx.even?
            new_arr << proc1.call(el)
        else
            new_arr << proc2.call(el)
        end 
    end
    new_arr
end

