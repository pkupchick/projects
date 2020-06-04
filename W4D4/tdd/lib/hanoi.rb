class Towers
  attr_accessor :towers

    def initialize
      @towers = [[3, 2, 1],[],[]]
    end

    def move(grab, place)
      if @towers[grab].empty?
        raise "no discs in the stack"
      elsif !valid_move?(grab,place)
        raise "Cannot move larger disc onto smaller disc"
      else
        @towers[place] << @towers[grab].pop
      end
    end
    
    def valid_move?(grab, place)
      return true if @towers[place].empty?
      if @towers[grab].last > @towers[place].last
        false
      else
        true
      end
    end

    def won?
      return true if @towers == [[],[3,2,1],[]] || [[],[],[3,2,1]]
    end


    def make_move
      begin
        puts "enter a move example 1, 2"
        input = gets.chomp.split(", ").map(&:to_i)
        move(input[0], input[1])
      rescue
        retry
      end
    end
end

# new = Towers.new

# new.move(0,2)
# new.move(0,1)
# p new.move(0,1)