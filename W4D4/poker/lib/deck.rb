require_relative "card.rb"
class Deck

    attr_accessor :deck
    def initialize
        @deck = []
    end

    def fill_deck
        values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        suits = [:♠, :♥, :♦, :♣]
        suits.each do |suit|
            values.each do |value|
                @deck << Card.new(value, suit)
            end
        end
    end

    def card_count
        @deck.length
    end

    def suit_count
        suits = Hash.new(0)
        deck.each do |card|
            suits[card.suit] += 1
        end
        suits.values.all? { |suit| suit == 13 }
    end

    def cards_per_suit
        cards = Hash.new(0)
        deck.each do |card|
            cards[card.value] += 1
        end
        cards.values.all? { |card| card == 4  }
    end

    def shuffle
        deck.shuffle!
    end
end