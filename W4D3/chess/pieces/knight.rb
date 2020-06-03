require_relative "stepable"
require_relative "piece.rb"
require_relative "../board.rb"
class Knight < Piece
include Stepable

    def move_diffs
        knight
    end

    def to_s
        " ♞ "
    end

    def symbol
        "♞".colorize(@color)
    end
end

# b = Board.new
# b.fill_board
# kt = Knight.new(:white, [3,3], b)
# b[[3,3]] = kt
# p b[[3,3]]
# p kt.moves