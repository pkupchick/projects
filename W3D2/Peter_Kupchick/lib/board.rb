class Board

    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size, "_") }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all? { |ele| ele == mark }
        end
    end

    def complete_col?(mark)
        @grid.transpose.any? do |row|
            row.all? { |ele| ele == mark }
        end
    end

    def complete_diag?(mark)
        count = 0
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                count += 1 if @grid[i][j] == mark && i == j
            end
        end
        count_2 = 0 
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                count_2 += 1 if @grid[i][j] == mark && (i + j == @grid.length - 1)
            end
        end
        count == @grid.length || count_2 == @grid.length
    end

    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) ||complete_diag?(mark)
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
