
def all_words_capitalized?(array)
    array.all? {|el|  el == el.capitalize} 

end

def no_valid_url?(array)
    suffix = ['.com', '.net', '.io', '.org' ]
    array.none? {|el| el.end_with?(*suffix) }


end


def any_passing_students?(array)   
    array.any? do |el| 
       (el[:grades].sum / el[:grades].length) >= 75
    end 
end