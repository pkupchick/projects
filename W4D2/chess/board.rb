require_relative "piece.rb"
require "byebug"
class Board
    attr_reader :board
    def initialize
        @board = Array.new(8) { Array.new(8) { NullPiece.new } }
    end

    def [](pos)
        x, y = pos
       @board[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @board[pos[0]][pos[1]] = value
    end

    def fill_board
        (0..7).each do |i|
            (0..7).each do |j|
                pos = [i, j]
                self[pos] = Piece.new(:white) if i < 2 
                self[pos] = Piece.new(:black) if i > 5
            end
        end
    end 
                #  1 , 2 [1, 2]
    def move_piece(start_pos, end_pos, color)
        
        # x1, y1 = start_pos
        # x2, y2 = end_pos

        if self[end_pos].color != color && valid?(end_pos)
            self[end_pos] = self[start_pos]
            self[start_pos] = NullPiece.new 
        else
            self.move_piece
        end
    end

    def valid?(pos)
        x, y = pos
        x <= 7 && x >= 0 && y <= 7 && y >= 0
    end


end


#8x8

# white
#row 0
#row 1

#w
# row of pawns @ row 6
# row of Rook,  @ row 7

