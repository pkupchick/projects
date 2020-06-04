require "test_dd"

describe "#my_unique" do 
    it "should accept an array" do 
        expect {my_unique([1,1,2,3,3])}.to_not raise_error
    end

    it "should return an array" do 
        expect(my_unique([1,1,2,3,3])).to eq([])
    end

    it "should return an array of only unique elements" do
        expect(my_unique([1,1,2,3,3])).to eq([1,2,3])
    end
end
