require_relative "00_tree_node"
require "byebug"
class KnightPathFinder
    attr_reader :considered_positions

    def initialize(initial_pos)
        @start = initial_pos
        @considered_positions = [initial_pos]
        @root = PolyTreeNode.new(initial_pos)
    end   
    
    def self.possible_moves(pos)
        row, col = pos
        [[row - 2,col - 1],[row - 2, col + 1],
        [row - 1,col - 2],[row - 1, col + 2],
        [row + 1,col - 2],[row + 1, col + 2],
        [row + 2,col - 1],[row + 2, col + 1]]
    end

    def self.valid_moves(pos)
        moves = self.possible_moves(pos)
        moves.select do |move|
            move.all? { |ele| ele > -1 && ele < 8 }
        end
    end    

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        new_pot_moves = moves.reject { |move| @considered_positions.include?(move) }
        @considered_positions += new_pot_moves
        new_pot_moves
    end

    def build_move_tree
         queue = [@root]
        until queue.empty?
            step_1 = queue.shift
            moves = new_move_positions(step_1.value)
            moves.each do |move|
                step_1.add_child(PolyTreeNode.new(move))
            end
            debugger
            queue += step_1.children 
        end       
    end   
    
    def find_path(final_pos)
        @root_node.bfs(final_pos)
    end    

    def trace_back_path(node)
        path = [node.value]
        
    end    
end

