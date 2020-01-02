def palindrome?(str)
  new = ''
  i = 0
  while i < str.length
    new = str[i] + new
    i += 1
  end
  return true if new == str
  false
end

def substrings(str)
    result = []
    letters = str.split("")
    letters.each_with_index do |el1,i1|
        i2 = 0
        while i2 < str.length
          result << (str[i1..i2]) if i2 >= i1
          i2 += 1
        end
    end

    result  
end

def palindrome_substrings(str)
  new = []
  substring = substrings(str)
  substring.each do |el|
    if palindrome?(el) && el.length > 1
      new << el
    end
  end
  
  new
end