require_relative "stepable"
require_relative "piece.rb"
require_relative "../board.rb"

class King < Piece
include Stepable

    def move_diffs
        king
    end

    def to_s
        " ♚ "
    end

    def symbol
        "♚".colorize(@color)
    end
end

# b = Board.new
# b.fill_board
# kt = King.new(:white, [3,3], b)
# b[[3,3]] = kt
# p kt.moves