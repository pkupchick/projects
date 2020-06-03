class Piece
    attr_reader :color
    def initialize(color)
        @color = color
    end
    def present?
      true
    end
  
    def to_s
      " ♟️ "
    end
end
  
class NullPiece < Piece
    def initialize
        @color = :yellow
    end
    def present?
        false
    end

    def to_s
        "   "
    end
end

#
# Create seperate class files for each individual piece  
#

