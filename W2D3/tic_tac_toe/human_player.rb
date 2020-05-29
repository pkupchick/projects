require "./board.rb"
#human player

class Humanplayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        puts "Player #{mark_value}, please enter a position, Example: 1 2"
        input = gets.chomp.split.map(&:to_i)
        if input.length != 2
            raise "Sorry, that was invalid :("
        else
            return input
        end
    end


end

# board = Board.new
# human = Humanplayer.new("X")
# human.get_position