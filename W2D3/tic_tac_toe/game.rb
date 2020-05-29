require "./board.rb"
require "./human_player.rb"
# game

class Game

    def initialize(player_1, player_2)
        @player_1 = Humanplayer.new(player_1)
        @player_2 = Humanplayer.new(player_2)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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