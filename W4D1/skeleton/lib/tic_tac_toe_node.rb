require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?   
      return board.winner != evaluator && board.won?
    end      

    # if @board.over? && board.winner != evaluator   
    #   return true
    # # else
    # #   return false  
    # end      

    if self.next_mover_mark == evaluator

      self.children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      self.children.any? do |child|
        child.losing_node?(evaluator)
      end  
    end  

  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
    
    if self.next_mover_mark == evaluator
      self.children.any? do |child|
        child.winning_node?(evaluator)
      end
    else
      self.children.all? do |child|
        child.winning_node?(evaluator)
      end
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    kids = []
    #   if @board.empty?
    #     positions = [
    #       [0, 0], [0, 1], [0, 2], 
    #       [1, 0], [1, 1], [1, 2],
    #       [2, 0], [2, 1], [2, 2]
    #     ]
    #     kids = positions
    #   end
    # kids

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx, col_idx]
        if @board[pos].nil?
          clone = @board.dup
          clone[pos] = self.next_mover_mark
          next_mover_mark = (self.next_mover_mark == :x ? :o : :x)

          kids << TicTacToeNode.new(clone, next_mover_mark, pos)
        end
      end    
    end
    kids
  end
end  

