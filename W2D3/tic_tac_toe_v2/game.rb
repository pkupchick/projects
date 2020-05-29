require "./board.rb"
require "./human_player.rb"
# game

class Game

    def initialize(n, *marks)
        @players = marks.map { |mark| Humanplayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end
    
    def play
        while @board.empty_position? && !@board.win?(@current_player.mark_value)
            @board.print
            input = @current_player.get_position
            @board.place_mark(input, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                puts "VICTORY! Player #{@current_player} won"
            else
                self.switch_turn
            end
        end
    end


end