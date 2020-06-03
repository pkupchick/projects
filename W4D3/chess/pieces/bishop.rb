require_relative "slideable"
require_relative "piece.rb"

class Bishop < Piece 
    include Slideable
    
    def move_dirs
        diagonal_dirs
    end

    def to_s
        " ♝ "
    end
end