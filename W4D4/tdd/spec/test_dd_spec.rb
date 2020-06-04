require "test_dd"
describe "#PART_1" do

    describe "#my_unique" do 
        it "should accept an array" do 
            expect {my_unique([1,1,2,3,3])}.to_not raise_error
        end

        it "should return an array of only unique elements" do
            expect(my_unique([1,1,2,3,3])).to eq([1,2,3])
        end
    end

    describe "#two_sum" do
        it "should find all pairs of positions where the elements at those positions sum to zero " do
            expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
        end

        it "should return index pairs in the order that the appear in the original array" do
            expect(two_sum([-1, 0, 2, -2, 1])).to_not eq([[4, 0], [3, 2]])
        end
    end

    describe "#my_transpose" do 
        it "should transpose a multi-dimensional array" do
            expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6] ,[1, 4, 7], [2, 5, 8]])
        end
    end

    describe "#my_stock_picker" do
        it "should output the most profitable pair of days on which to buy the stock and then sell the stock" do
            expect(my_stock_picker([100, 110, 98, 120, 200])).to eq([2, 4])
        end
    end
end