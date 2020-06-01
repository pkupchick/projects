require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new = TicTacToeNode.new(game.board, mark)
    kids = new.children
    new = kids.select {|kid| return kid.prev_move_pos if kid.winning_node?(mark)}
    new = kids.any? {|kid| return kid.prev_move_pos if !kid.losing_node?(mark)}
    raise "HOLY SHEET YOU BEAT ME!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
