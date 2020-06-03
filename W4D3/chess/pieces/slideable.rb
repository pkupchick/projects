module Slideable
 # keep incrementing/decrementing until we hit
 #
    HORIZONTAL_DIRS = [
        [-1, 0],
        [0, -1],
        [0, 1],
        [1, 0]
    ]

    DIAGNAL_DIRS = [
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1]
    ]


    def moves
        moves = []
        move_dirs.each do |directions|
            x, y = directions
            moves += grow_unblocked_moves_in_dir(x, y)
        end
        moves
    end

    
    def diagonal_dirs
        DIAGNAL_DIRS
    end
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    # private

    def grow_unblocked_moves_in_diagnol(start_pos)
        # [4,4]
        moves = []

        (0...8).each do |i|            
         moves << [i+-1 , +0]
        end

        moves
    end

    # base case x = 0 


    def grow_unblocked_moves_in_dir(xd, yd) # 3, 3 => 2, 3 => 1, 3 => 0, 3
        start_pos = self.position
        x, y = start_pos
        moves = []
        # horizontal_dirs.each do |xd, yd| #  [-1, 0]
            while x < 7 && x > 0 && y < 7 && y > 0
                x += xd
                y += yd
                next_position = [x ,y]
                if self.board[next_position].is_a?(NullPiece) 
                    moves << next_position 
                elsif self.board[next_position].color != self.color
                    moves << next_position
                    break
                else
                    break
                end
            end                                                         
        moves
    end
    
    def move_dirs
        raise "Implement this..."
    end
end




# if piece == queen then she can do (diagonal, horizontally/vertically, both)
# if piece == rook then he can go horizontally/vertically
# if piece == bishop then he can go diagonal


    
    # def self.valid_moves(pos)
    #     x, y = pos
    #     moves = [
    #         [x-1,y+2],
    #         [x+1,y+2],
    #         [x+2,y+1],
    #         [x+2,y-1],
    #         [x+1,y-2],
    #         [x-1,y-2],
    #         [x-2,y-1],
    #         [x-2,y+1]
    #     ]