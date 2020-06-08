require "byebug"
# O(n^2) or quadratic due to nesting a loop
# O(1) space complexity, not storing any data outside of input
def two_sum(arr1, target)
    arr1.each_with_index do |ele_1, idx_1|
        arr1.each_with_index do |ele_2, idx_2|
            return true if ele_1 + ele_2 == target && idx_2 > idx_1
        end
    end
    return false
end

# p two_sum([0, 1, 5, 7], 6)

# p two_sum([0, 1, 5, 7], 10)

#sorting
# O(nlogn) we are dividing the array size or attackin from two fronts
#O(n) space is determined by number of indices given

def okay_two_sum?(arr, target)
    arr.sort!
    idx_1 = 0
    idx_2 = arr.length-1
    while idx_1 < idx_2
        case (arr[idx_1] + arr[idx_2]) <=> target
        when 0
            return true
        when -1
            idx_1 += 1
        when 1
            idx_2 -=1
        end
    end
    return false
end


# p okay_two_sum?([1, 0, 5, 7], 6)

# p okay_two_sum?([0, 1, 5, 7], 10)

def hash_two_sum(arr, target)
    hash = {}
    arr.each do |ele|
        return true if hash[target - ele]
        hash[ele] = true
    end
    return false
end

p hash_two_sum([1, 0, 5, 7], 6)

p hash_two_sum([0, 1, 5, 7], 10)