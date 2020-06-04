require_relative "deck.rb"

class Hand
    attr_accessor :hand, :deck
    def initialize(deck)
        @deck = deck
        @hand = []
    end

    def deal_hand
        5.times do 
            hand << @deck.deck.pop
        end
    end

    
end