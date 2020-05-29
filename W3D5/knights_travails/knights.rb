require_relative "00_tree_node"
require "byebug"
class KnightPathFinder
    attr_reader :considered_positions

    def initialize(initial_pos)
        @start = initial_pos
        @considered_positions = [initial_pos]
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
            move.all? { |pair| pair > -1 && pair < 8 }
        end
    end    

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        new_pot_moves = moves.reject { |move| @considered_positions.include?(move) }
        @considered_positions += new_pot_moves
        new_pot_moves
    end
end

new = KnightPathFinder.new([0,0])

new.considered_positions