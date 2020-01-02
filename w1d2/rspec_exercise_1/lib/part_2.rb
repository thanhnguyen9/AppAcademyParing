def hipsterfy(word)
    vowels = "oieau"
    i = word.length - 1
    while i > 0
        if vowels.include?(word[i])
            word[i] = "" 
            break
        end
        i -= 1
    end
    word
end

def vowel_counts(string)
    vowels = "aeiou"
    hash = Hash.new(0)

    string.downcase.each_char do |char|
        hash[char] += 1 if vowels.include?(char)
    end

    hash 
end

def caesar_cipher(message,num)
    new_string = ""
    alphabet = ("a".."z").to_a

    message.each_char.with_index do |char, idx|
        if alphabet.include?(char)
            new_string += alphabet[(alphabet.index(char) + num ) % 26]
        else
            new_string += char
        end

    end
    new_string
end