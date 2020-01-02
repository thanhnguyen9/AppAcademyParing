class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_array = []
    @secret_word.each_char.with_index {|c, i| new_array << i if char == c }
    new_array
  end

  def fill_indices(char, indices)
    indices.each {|i| @guess_word[i] = char }
  end

  # def try_guess(char)
  #   matching_indices = self.get_matching_indices(char)
  #   if matching_indices.empty?
  #     self.fill_indices(char, matching_indices)
  #   else
  #     @remaining_incorrect_guesses -= 1
  #   end
  #   if self.already_attempted?(char)
  #     p "that has already been attempted"
  #     return false
  #   else
  #     @attempted_chars << char
  #     return true
  #   end
  # end
  # "hello"
  # try_guess("x")
  # matching_indices = []
  # @guess_word = [_, _, _, _, _]
  # @attempted_chars = ["h", "x"]

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      matching_indices = self.get_matching_indices(char)
      self.fill_indices(char, matching_indices)

      @remaining_incorrect_guesses -= 1 if matching_indices.empty?
      
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char: "
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? ||  self.lose?
      p @secret_word
      true  
    else
      false 
    end
  end



end

