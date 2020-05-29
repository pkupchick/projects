require "./human_player.rb"
# Board

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def valid?(position)
        position[0] >= 0 && position[0] < @grid.length && position[1] >= 0 && position[1] < @grid.length
    end

    def empty?(position)
        i = position[0]
        j = position[1]
        @grid[i][j] == "_"
    end

    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise "NOT VALID POSITION"
        else
            i = position[0]
            j = position[1]
            @grid[i][j] = mark 
        end
    end

    def print
        @grid.each { |row| p row }
    end
    
    def win_row?(mark)
      @grid.each do |row|
        if row.all? { |ele| ele == mark }
            return true
        end
      end
      return false
    end

    def win_column?(mark)
        transposed = @grid.transpose
         transposed.each do |column|
            if column.all? { |ele| ele == mark }
                return true
            end
         end
        return false
    end


    def win_diagonal?(mark)
        count = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j] == mark && i == j
                    count += 1
                end
            end
        end

        count2 = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j] == mark && (i + j == @grid.length - 1)
                    count2 += 1
                end
            end
        end
        count2 == @grid.length || count == @grid.length
    end
    
    def win?(mark)
        self.win_column?(mark) || self.win_diagonal?(mark) || self.win_row?(mark)
    end

    def empty_position?
        @grid.each do |row|
            if row.any? { |position| position == "_" }
                return true
            end
        end
        return false
    end

end

# p board.valid?([8, 0]) #=> false
# p board.valid?([1, 0]) #=> true
# board.place_mark([0,0], "X")
# board.place_mark([0,1], "X")
# board.place_mark([0,2], "X")
# board.place_mark([1,0], "X")
# board.place_mark([1,1], "X")
# board.place_mark([1,2], "X")
# board.place_mark([2,0], "X")
# board.place_mark([2,1], "X")
# board.place_mark([2,2], "X")

# p board.grid
# board.place_mark([20,0], "X")
# p board.empty?([1, 0]) # true

board.print

# p board.win_diagonal?("X")
# p board.win?("X")
# p board.empty_position?