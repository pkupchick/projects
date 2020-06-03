require_relative "slideable"
require_relative "piece.rb"

class Rook < Piece 
    include Slideable
    
    def move_dirs
        horizontal_dirs
    end

    def to_s
        " ♜ "
      end
end