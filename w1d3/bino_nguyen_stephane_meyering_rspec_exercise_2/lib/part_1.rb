def partition(arr, num)
  less = []
  greater = []
  arr.each { |i| i >= num ? greater << i : less << i }

  [less, greater]
end

def merge(h1,h2)
    new_hash = {}
    h1.each do |k,v|
        new_hash[k] = h1[k]
    end
    h2.each do |k,v|
        new_hash[k] = h2[k]

    end
    new_hash

end

def censor(sentence, arr)
  vowels = 'aeiou'
  new_sentence = []
  sentence.split(' ').each do |word|
    if arr.include?(word.downcase)
      new_sentence << convert(word)
    else
      new_sentence << word
    end
  end
  
  new_sentence.join(' ')
end

def convert(word)
  vowels = 'aeiou'
  new_word = ''
  word.each_char do |char|
    if vowels.include?(char.downcase)
      new_word += '*'
    else
      new_word += char
    end
  end

  new_word
end

# 2**1 = 2 (num = 1)

def power_of_two?(num)
    return true if num == 1
    (1..num).each do |p|
        return true if 2**p == num       
    end
    false
end


