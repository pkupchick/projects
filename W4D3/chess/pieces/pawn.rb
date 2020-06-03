require_relative "piece.rb"
require_relative "../board.rb"
class Pawn < Piece
    def moves
        forward_steps + side_attacks
    end


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

    # private
    def at_start_row?
        position[0] == 1 || position[0] == 6
    end
    
    def forward_dir
        self.color == :white ? 1 : -1
    end

    def forward_steps
        x, y = self.position
        step_1 = [x + forward_dir, y]
        step_2 = [x + 2 * forward_dir, y]
        moves = []
        
        if self.at_start_row?
            if board.valid?(step_1) && board.valid?(step_2)
                moves << step_1
                moves << step_2
            end
        else
            if board.valid?(step_1) 
                moves << step_1
            end
        end
        moves
    end

    def side_attacks
        x, y = self.position
        moves = []

        if self.color == :white 
            vul_pos_1 = [x+1, y+1] 
            vul_pos_2 = [x+1, y-1]
            moves << vul_pos_1 if board[vul_pos_1].color == :black
            moves << vul_pos_2 if board[vul_pos_2].color == :black
        else
            vul_pos_1 = [x-1, y+1]
            vul_pos_2 = [x-1, y-1]
            moves << vul_pos_1 if board[vul_pos_1].color == :white
            moves << vul_pos_2 if board[vul_pos_2].color == :white
        end
        moves
    end

end
# b = Board.new
# b.fill_board
# pawn = Pawn.new(:white, [3,3], b)
# b[[3,3]] = kt
# p b[[3,3]]
# p kt.moves


# WHITE if the position pawn row 1 then moves can do two steps col + 2 or 1
# 
# WHITE if the position pawn row > 1 then moves can do one steps col + 1 
# WHITE When attaking can either shift row (-1)left or (1)right and the col is + 1 

# BLACK if the position pawn row 6 then moves can do two steps
#
# BLACK if the position pawn row > 6 then moves can do one steps
# BLACK When attaking can either shift row (-1)left or (1)right and the col is + 1 