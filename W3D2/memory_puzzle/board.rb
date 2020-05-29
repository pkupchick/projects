require_relative "card.rb"
class Board


    attr_reader :size, :board

    def initialize(size)

        if size.even? && size <= 6
            @size = size
        else
            raise "Must be even"
        end
        @board = Array.new(size) {Array.new(size, "_")}
    end

    
    
    def populate
        num_pairs = (@size * @size) / 2
        values1 = Card.pairs(num_pairs)
        values1 += values1
        values1.shuffle!
        
       (0...@board.length).each do |r|
            (0...@board.length).each do |c|
                @board[r][c] = Card.new(values1.pop)
            end
        end
    end


    def render
        system("clear")
        @board.map do |rows|
            rows.map do |card|
                card.display
            end
        end
    end

    def won?
        @board.all? do |row|
            row.all? {|card| card.reveal?}
        end
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @board[row][col] = value
    end

    def reveal(pos)
        if !self[pos].reveal?
            self[pos].reveal
            self[pos].display
        end
    end

end

# a = Board.new(6)

# a.populate
# # a.board[0][0].reveal
# p a.render
# p a.won?
# p a.reveal([1, 1])
# p a.render


