def my_min(arr)
    curr_min = arr[0]
    arr.each do |ele|
        if ele < curr_min
            curr_min = ele
        end
    end
    curr_min
end

# p my_min([0, 3, 5, 4, -5, 10, 1, 90])

def largest_contiguous_subsum(arr)
    solved = 0
        (0...arr.length).each do |start_idx|
            (start_idx...arr.length).each do |end_idx|
                subset = arr[start_idx..end_idx].inject(&:+)
                solved = subset if subset > solved
            end
        end
    solved
end

def largest_contiguous_subsum_1(arr)
  champ = arr.first
  contender = arr.first

  (1...arr.length).each do |i|
    contender = 0 if contender < 0
    contender += arr[i]
    champ = contender if contender > champ
  end

  champ
end

p largest_contiguous_subsum_1([-5, -1, -3])

