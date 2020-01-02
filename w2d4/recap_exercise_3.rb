# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new 
# array containing the elements that were not repeated in the array.

# def no_dupes?(arr)
#     new_hash = Hash.new(0)
#     result = []

#     arr.each { |ele| new_hash[ele] += 1 }

#     new_hash.each { |k, v| result << k if v == 1 }

#     result
# end


# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []









# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method
#  should return true if an element never appears consecutively in the array; it should
#   return false otherwise.

# def no_consecutive_repeats?(arr)
#     (0...arr.length-1).each {|i| return false if arr[i] == arr[i+1] }
#     true
# end


# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true



# char_indices
# Write a method char_indices(str) that takes in a string as an arg. 
# The method should return a hash containing characters as keys.
#  The value associated with each key should be an array containing the indices where
#   that character is found.
# def char_indices(str)
#     new_hash = Hash.new {|h,k| h[k] = [] }

#     str.each_char.with_index do |char, i|
#         new_hash[char] << i
#     end
#     new_hash
# end
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.

# def longest_streak(str)
#     result = 1
#     new_string = ""
#     str.each_char.with_index  do |char_1, idx1|
#         count = 1
#         str.each_char.with_index  do |char_2, idx2|
#             if idx2 > idx1 && char_1 == char_2
#                 count += 1
#             end
#         end
        
#         if count >= result 
#             result = count 
#             new_string = char_1*result
#         end
#     end
#     new_string
# end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime.
# A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def prime?(n)
    (2...n).each { |ele| return false if n % ele == 0 }
    true
end

def factors(n)
    factors_array = []

    (2...n).each { |ele| factors_array << ele if n % ele == 0 && prime?(ele) }

    factors_array
end

def bi_prime?(num)
    arr = factors(num)

    arr.each do |num_1|
        arr.each do |num_2|
            return true if num_1 * num_2 == num
        end
    end

    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


# vigenere_cipher

# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, 
# called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. 
# For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, 
# returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

def ciphered(char, i, arr)
    alphabet = ("a".."z").to_a
    new_char = ""

    old_index = alphabet.index(char)
    new_index = (old_index + arr[(i % arr.length) - 1]) % 26
    new_char = alphabet[new_index]
    
    new_char
end

def vigenere_cipher(message, keys)
    i = 1
    alphabet = ("a".."z").to_a
    result = ""

    message.each_char do |char|
        if i > keys.length
            i = 1
            result += ciphered(char, i, keys)
            i += 1
        else
            result += ciphered(char, i, keys)
            i += 1
        end
    end

    result
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"




# Write a method vowel_rotate(str) that accepts a string as an arg and returns the 
# string where every vowel is replaced with the vowel the appears before it sequentially 
# in the original string. The first vowel of the string should be replaced with the last 
# vowel.

def vowel_rotate(str)
    v = "aeuio"
    new = []

    str.each_char { |el| new << el if v.include?(el) }

    el = new[-1]
    new.unshift(new[-1])
    new.pop
    new_string = ""
    i = 0

    str.each_char do |el|
        if v.include?(el)
            new_string += new[i]
            i+=1
        else
            new_string += el
        end
    end
    new_string
end


# #["o","u","e"] -> ["e","o","u"]
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

# String#select
# Extend the string class by defining a String#select method that accepts a block. 
# The method should return a new string containing characters of the original string 
# that return true when passed into the block. If no block is passed, then return the 
# empty string. Do not use the built-in Array#select in your solution.

class String
    def select(&prc)
        result = ""
        if !prc.nil?
            self.each_char {|char| result += char if prc.call(char) }    
        end
        p result
    end


    def map!(&prc)
        self.each_char.with_index { |char, i|  self[i] = prc.call(char) }
        p self
    end
end
# "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# "HELLOworld".select          # => ""

"hi i am danny".map! { |ch| ch.upcase }