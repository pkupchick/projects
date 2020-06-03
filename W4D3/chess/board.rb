require_relative "./pieces/piece.rb"
require_relative "./pieces/Pawn.rb"
require_relative "./pieces/King.rb"
require_relative "./pieces/Queen.rb"
require_relative "./pieces/Rook.rb"
require_relative "./pieces/Bishop.rb"
require_relative "./pieces/Knight.rb"
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

                self[pos] = Rook.new(:white,[0,0], self) if i == 0 && j == 0
                self[pos] = Rook.new(:white,[0,7], self) if i == 0 && j == 7
                self[pos] = Knight.new(:white,[0,1], self) if i == 0 && j == 1
                self[pos] = Knight.new(:white,[0,6], self) if i == 0 && j == 6
                self[pos] = Bishop.new(:white,[0,2], self) if i == 0 && j == 2
                self[pos] = Bishop.new(:white,[0,5], self) if i == 0 && j == 5
                self[pos] = Queen.new(:white,[0,3], self) if i == 0 && j == 3
                self[pos] = King.new(:white,[0,4], self) if i == 0 && j == 4
                self[pos] = Pawn.new(:white, pos, self) if i == 1 
                
                
                # #Black
                self[pos] = Rook.new(:black,[0,0], self) if i == 7 && j == 0
                self[pos] = Rook.new(:black,[0,7], self) if i == 7 && j == 7
                self[pos] = Knight.new(:black,[7,1], self) if i == 7 && j == 1
                self[pos] = Knight.new(:black,[7,6], self) if i == 7 && j == 6
                self[pos] = Bishop.new(:black,[7,5], self) if i == 7 && j == 5
                self[pos] = Bishop.new(:black,[7,2], self) if i == 7 && j == 2
                self[pos] = Queen.new(:black,[7,3], self) if i == 7 && j == 3
                self[pos] = King.new(:black,[7,4], self) if i == 7 && j == 4
                self[pos] = Pawn.new(:black, pos, self) if i == 6
            end
        end
        
    end 
               
    def move_piece(start_pos, end_pos, color)
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

    def render


    end

end