class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
DICTIONARY = ["dog", "cat", "book", "pizza"]

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
    return true if @attempted_chars.include?(char) else return false
  end

  def get_matching_indices(char)
    solved = []
    @secret_word.each_char.with_index do |let, idx|
      if let == char
        solved << idx
      end
    end
    solved
  end

  def fill_indices(char, arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      attempted_chars << char
    end

    if @secret_word.include?(char)
      fill_indices(char, get_matching_indices(char))
    else
      @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end


end