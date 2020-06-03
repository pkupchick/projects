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
        diagonal_dirs.each do |directions|
            x, y = directions
            moves << grow_unblocked_moves_in_dir(x, y)
        end
    end

    
    def diagonal_dirs
        DIAGNAL_DIRS
    end
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    private

    def grow_unblocked_moves_in_dir(-1, 0)
        # [4,4]
        moves = []

        (0...8).each do |i|            
         moves << [i+-1 , +0]
        end

        moves
    end
    
    def move_dirs
        
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