require "hanoi"

describe Towers do
    subject(:towers) { Towers.new }

    describe "#move" do
        it "allows moving to open space" do
            expect { towers.move(0, 1) }.not_to raise_error
        end

        it "does not allow moving discs from empty stack" do
            expect { towers.move(2, 1) }.to raise_error("no discs in the stack")
        end

        it "allows moving onto a larger disc" do
            towers.move(0, 2)
            towers.move(0, 1)
            expect { towers.move(2, 1) }.not_to raise_error
        end

        it "does not allow placing larger disc onto smaller disc" do
            towers.move(0, 2)
            expect { towers.move(0, 2) }.to raise_error("Cannot move larger disc onto smaller disc")
        end
    end

    describe "#won?" do
        it "game is won when all discs are moved to last tower" do
            towers.move(0, 2)
            towers.move(0, 1)
            towers.move(2, 1)
            towers.move(0, 2)
            towers.move(1, 0)
            towers.move(1, 2)
            towers.move(0, 2)

            expect(towers).to be_won
        end

        it "game is won when all discs are oved to middle tower" do
            towers.move(0, 1)
            towers.move(0, 2)
            towers.move(1, 2)
            towers.move(0, 1)
            towers.move(2, 0)
            towers.move(2 ,1)
            towers.move(0, 1)

            expect(towers).to be_won
        end

    end


end
