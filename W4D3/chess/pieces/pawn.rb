require_relative "piece.rb"

class Pawn < Piece
    def symbol
        " ♟ "
    end
    
    def to_s
        if color == :white
            " ♟ "
        else
            " ♙ "
        end
    end
end

# WHITE if the position pawn row 1 then moves can do two steps col + 2 or 1
# 
# WHITE if the position pawn row > 1 then moves can do one steps col + 1 
# WHITE When attaking can either shift row (-1)left or (1)right and the col is + 1 

# BLACK if the position pawn row 6 then moves can do two steps
#
# BLACK if the position pawn row > 6 then moves can do one steps
# BLACK When attaking can either shift row (-1)left or (1)right and the col is + 1 