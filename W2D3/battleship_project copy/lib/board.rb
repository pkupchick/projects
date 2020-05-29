class Board
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n,:N)}
    @size = n * n
  end

  def [](array)
    @grid[array[0]][array[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end
  
  def num_ships
    count = 0
    @grid.each do |rows|
      rows.each { |s_vals|  count += 1 if s_vals == :S }
    end
    count
  end

  def attack(position) # [row][column]
    if self[position] == :S
       self[position] = :H
       puts "you sunk my battleship!"
       return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    
    num_ships = @size / 4
   
    n = @grid.length 
    coordinates = []
    
    (0..n-1).each_with_index do |num1, i1|
      (0..n-1).each_with_index do |num2, i2|
        if i2 >= i1
          coordinates << [num1, num2]
        end
      end
    end

    ship_positions = coordinates.sample(num_ships)

    ship_positions.each { |position| self[position] = :S }

    # while num_ships >= 0
    #   @grid.each do |row|
    #     row.each do |ele|
    #       ele = :S
    #       num_ships -= 1
    #     end
    #   end
    # end
    # @grid.shuffle
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

  def hidden_ships_grid
    hidden = Array.new(@grid.length) { Array.new(@grid.length, :N) }
    @grid.each_with_index do |sub_arr, i|
      sub_arr.each_with_index do |ele, j|
        if ele == :X
           hidden[i][j] = :X
        end
      end
    end
    hidden
  end

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end


# @grid contains :S, :X and :N
# return new array where :S is changed to :N

=begin 
n = @grid.length
hidden = Array.new(n) { Array.new(n, :N) }
@grid.each_with_index do |row, i|
  row.each do |ele, j|
    if ele == :X
      hidden[i][j] = :X
    end
  end
end
hidden
=end


  # board.instance_variable_set(:@grid, [[:S, :N],[:X, :S]])
  #       board.hidden_ships_grid
  #       expect(board.instance_variable_get(:@grid)).to eq([[:S, :N],[:X, :S]])