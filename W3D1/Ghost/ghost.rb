#Ghost
require "set"
require_relative "player.rb"

class Ghost
    
    attr_reader :dictionary, :fragment
    def initialize(player_1, player_2)
        dict = File.readlines("dictionary.txt").map(&:chomp)
        @players = [player_1, player_2]
        @fragment = ""
        @dictionary = Set.new(dict)
        @losses = Hash.new { |players, losses| losses[player] = 0 }
    end

    def inspect
        return self.object_id
    end

    def play_round
        
    end

    #helpers
    def current_player
        @players.first
    end

    def previous_player
        @players[-1]
    end

    def next_player!
        @players.rotate!(1)
    end

    def take_turn(player)
        puts "Enter a letter, #{current_player}:"
        input = gets.chomp.downcase
        if dictionary.any? {|word| word.start_with?(@fragment+input)}
            @fragment += input
            self.next_player!          
        else
            self.lose
        end
    end

    def lose 
        puts "You big ol' idiot! You lost! Do something else."
        @losses[current_player] += 1
    end

    


end