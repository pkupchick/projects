require_relative "board.rb"

class Game

    def initialize(player, size=4)
        @board = Board.new(size)
        @board.populate
        @player = player
        @previous_guess = nil
    end

    def make_guess(pos)
        if @previous_guess.nil?
            @previous_guess = pos
            @board.reveal(pos)
        else
            if @board[pos] == @board[@previous_guess]
                @board.reveal(pos)
                @previous_guess = nil
            else
                @board.reveal(pos)
                p @board.render
                @board[pos].hide
                @board[@previous_guess].hide
                @previous_guess = nil
                sleep(2)
            end
        end
    end


    def play
        until @board.won?
            p @board.render
            puts "Enter you guess; Example 0 2"
            pos = gets.chomp.split.map(&:to_i)
            self.make_guess(pos)
            
        end
    end
end


game = Game.new("blahh", 2)
game.play