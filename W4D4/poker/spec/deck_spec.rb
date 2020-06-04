require "deck"

describe Deck do 
    subject(:deck) { Deck.new }

    describe "Initialize" do

        it "should start with an empty deck" do
            expect(deck.deck).to be_empty
        end
    end

    describe "Card count" do

        it "deck should contain 52 card instances" do
            deck.fill_deck
            expect(deck.card_count).to eq(52)
        end
        
        it "should have 13 cards of each suit" do
            expect(deck.suit_count).to eq(true)
        end

        it "should have 4 cards of each suit" do
            expect(deck.cards_per_suit).to eq(true)
        end

    end

end