require_relative "00_tree_node"

class KnightPathFinder
    def initialize(initial_pos)
        # @root_node = PolyTreeNode.new(initial_pos)
        @board = Array.new(8) { Array.new(8) }
        @considered_positions = [initial_pos]
    end   
    
    def self.valid_moves(pos)
        hor = pos[0]
        vert = pos[1]
        new_valid_moves = [].uniq
        (-2..2).each do |i|
            (-2..2).each do |j|
                if i != j && i != 0 && j != 0
                    new_hor = hor + i
                    new_vert = vert + j
                end
                new_valid_moves << [new_hor,new_vert] if (new_hor >= 0 && new_hor <= 7) && (new_vert >= 0 && new_vert <=7)
            end
        end
        new_valid_moves
    end    

    def new_move_positions(pos)
        if !@considered_positions.include?(pos) && valid_moves(pos)
        end
    end
end

