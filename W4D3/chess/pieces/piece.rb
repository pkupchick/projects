class Piece
    attr_reader :color, :position, :board
    def initialize(color, position, board)
        @position = position
        @color = color
        @board = board
    end
    def present?
      true
    end
  
    def to_s
      " ♟️ "
    end
end
  
class NullPiece < Piece
    def initialize
        @color = :yellow
    end
    def present?
        false
    end

    def to_s
        "   "
    end
end

#
# Create seperate class files for each individual piece  
#

# load "pieces/queen.rb"

# [2] pry(main)> load "board.rb"