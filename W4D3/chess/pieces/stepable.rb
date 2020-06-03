module Stepable

    KNIGHT = [
        [-2, -1],
        [-2, 1],
        [-1, -2],
        [-1, 2],
        [1, -2],
        [1, 2],
        [2, -1],
        [2, 1]
    ]

    KING = [
        [-1, 0],
        [0, -1],
        [0, 1],
        [1, 0],
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1]
    ]
    def moves
        moves = []
        move_diffs.each do |directions|
            x, y = directions
            moves += grow_unblocked_moves_in_diff(x, y)
        end
        moves
    end

    def grow_unblocked_moves_in_diff(xd, yd) 
        start_pos = self.position
        x, y = start_pos
        moves = []
            # King: We just need one step forward in which ever direction
            x += xd
            y += yd
            
            if x < 7 && x > 0 && y < 7 && y > 0
                next_position = [x ,y]
                if self.board[next_position].is_a?(NullPiece) 
                    moves << next_position 
                elsif self.board[next_position].color != self.color
                    moves << next_position
                # elsif self.board[next_position].color == self.color 
                end
            end                                                  
        moves
    end

    def knight
        KNIGHT
    end
    
    def king
        KING
    end

    def move_diff
        raise "Blaah implement it in the piece class"
    end
end


