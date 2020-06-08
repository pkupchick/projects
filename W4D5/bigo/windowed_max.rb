# O(n) time
# O(n) spcae as hash grows in proportion to array size

def windowed_max_range(arr, size)
    hash = Hash.new(0)
    i = 0
    while i < arr.length - 1
        hash[i] = arr[i...size+i]
        i += 1
    end
    winner = []
    hash.each do |k, v|
       if v.sum > winner.sum
        winner = v
       end
    end
    winner
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8