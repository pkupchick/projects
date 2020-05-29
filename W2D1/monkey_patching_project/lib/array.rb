# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self == []
    self.max - self.min
  end

  def average
    return nil if self == []
    self.sum.to_f / self.length
  end
  
  def median
    return nil if self.empty?
    
    sorted = self.sort   # [1, 2, 3, 4]
    mid = self.length/2  # middle idx

    if !self.length.even? 
       return sorted[mid]
    else 
       return (sorted[mid - 1] + sorted[mid])/2.0
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if ele == value }
    count
  end

  def my_index(val)
    return nil if !self.include?(val)
    self.each_with_index do |ele, i|
        if val == ele
            return i 
        end
    end  
  end

  def my_uniq
    # solution1
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1 }
    hash.keys

    # solution2
    # hash = {}
    # self.each { |ele| hash[ele] = true }
    # hash.keys
  end

  def my_transpose
    # solution1
    # newarr = Array.new(self.first.length) { [] }
    #        (0 ... self[0].length).each do |i|
    #         self.each do |ele|
    #             newarr[i] << ele[i]
    #         end
    #     end
    # newarr

    # solution2
    # length = self[0].length
    # (0...length).map do |i|
    #     self.map { |arr| arr[i] }
    # end

    # solution3
    (0...self.length).map { |i| self.map { |arr| arr[i] } }
  end
end

