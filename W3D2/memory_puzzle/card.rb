
class Card
    VALUES = ("A".."Z").to_a

    def self.pairs(num_pairs)
        # values = VALUES
        VALUES.shuffle.take(num_pairs)
    end

    attr_reader :facevalue
    def initialize(facevalue)
        @facevalue = facevalue
        @faceup = false
    end

    def display
        return @facevalue if @faceup
    end

    def hide
        @faceup = false
    end

    def reveal
        @faceup = true
    end

    def reveal?
        @faceup
    end

    def to_s
       return @facevalue.to_s if @faceup
    end

    def==(object)
        @facevalue == object.facevalue
    end
    
end