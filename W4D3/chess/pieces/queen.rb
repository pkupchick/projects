require_relative "slideable"
require_relative "piece.rb"
class Queen < Piece
include Slideable

    def move_dirs
        horizontal_dirs + diagnol_dirs
    end
end