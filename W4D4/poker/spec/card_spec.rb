require "card"

describe Card do
    subject(:card) { Card.new("K", :♡) }

    describe "#initialize" do
        it "accept a value as argument" do
            expect(card.value).to eq("K")
        end

        it "accept a suit" do
            expect(card.suit).to eq(:♡)
        end
    end
end