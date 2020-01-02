require 'byebug'

def zip(*arrs)
    result = []
   
    length = arrs[0].length

    (0...length).each do |i|
        temp = []
        arrs.each do |arr|
            temp << arr[i] 
        end
        result << temp
    end
    result
end

def prizz_proc(arr, prc_1, prc_2)
  result = []
  arr.each do |el|
    if (prc_1.call(el) && !prc_2.call(el)) || (!prc_1.call(el) && prc_2.call(el))
      result << el
    end
  end

  result
end

def longest(arr)
  return arr.length
end


def zany_zip(*arrs)
  result = []
  max = arrs[0].length

  arrs.each do |arr|
    if longest(arr) > max
        max = longest(arr)
    end
  end
    
  (0...max).each do |i|
    temp = []
    arrs.each do |arr|
      temp << arr[i]    
    end
    result << temp
  end

  result
end

def maximum(arr, &prc)
  return nil if arr.length == 0

  max = prc.call(arr[0]) 
  temp = arr[0]
  arr.each do |el|
    if prc.call(el) >= max
        max = prc.call(el)
        temp = el
    end
  end

  temp
end


def my_group_by(arr, &prc)
    hash = Hash.new { |h,k| h[k] = [] }
    arr.each do |el|
        hash[prc.call(el)] << el
    end
    hash
end


def max_tie_breaker(arr, prc, &blk)
    return nil if arr.length == 0
    max = blk.call(arr[0])
    temp = arr[0]
    arr.each do |el|

        if blk.call(el) > max 
            max = blk.call(el)
            temp = el
        end
    end
    temp
end

def count(word)
    v = "aeuio"
    count = 0
    word.each_char do |char|
        count += 1 if v.include?(char)
    end
    count >= 2
end


def remove(word)
    v = "aeuio"
    temp = ""
    word.each_char.with_index do |char, i|
        if v.include?(char)
            temp += word[i..-1]
            break
        end
    end

    (0...temp.length).reverse_each do |i|
        if v.include?(temp[i])
           temp = temp[0..i]
           break
        end
    end
    temp
end



def silly_syllables(sentence)
    result = []
    words = sentence.split
    words.each do |word|  
        if count(word) 
            result << remove(word)   
        else
            result << word  
        end
    end
    result.join(" ")
end

