
class Code
  attr_reader :pegs

POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| Code::POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(pegs)
    raise if !Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end

  def self.random(num)
    pegs = Array.new(num) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |i| guess[i] == @pegs[i] }
  end
  
  def num_near_matches(guess)
    num_matches = (0...guess.length).count do |i|
      guess_peg = guess[i]
      pegs.include?(guess_peg)
    end

    num_matches - self.num_exact_matches(guess)
  end

  def ==(other_code)
    self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end

end