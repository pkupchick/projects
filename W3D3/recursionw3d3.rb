require "byebug"
# Warmup

# Write a recursive method, range, that takes a start and an end 
# and returns an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, 
# you can return an empty array.

# Write both a recursive and iterative version of sum of an array.

def recursion_range(start,last)
    return [] if last <= start
    recursion_range(start,last-1) << last-1
end

def iterative_sum(start, last)
    sum = 0
    (start..last).each { |num| sum += num }
    sum
end

def recursion_sum(arr)
    return 0 if arr.empty?
    # arr[0] + recursion_sum(arr.drop(1))
    # arr[0] + recursion_sum(arr[1..-1])
    arr.shift + recursion_sum(arr)
end

# p recursion_range(1,5)
# p iterative_sum(1,5)
# p recursion_sum([1,2,3,4,5])

# Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# Note that for recursion 2, you will need to square the results of 
# exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you dont need to
# do anything special to square a number, just calculate the 
# value and multiply it by itself. So dont cheat and use exponentiation in your solution.


# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we 
# run in the first case?

# How deep will we need to recurse for the second? Keep in mind 
# that the first reduces the exponent by one for each recursion, 
# while the second reduces it by half.

# In addition to testing your methods by running the code, 
# try the following exercise:

# On paper, write out the value of each variable for every 
# line in the code:

# Write out what happens with base 0 and power 0 as inputs 
# (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. 
# e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to 
# the very end in these examples.

# How many examples do you need to walk through to be 
# confident that it works?

def exponentiation_1(base, power)
    return 1 if power <= 0
    base * exponentiation_1(base, power - 1)
end

def expon_2(base, power)
    return 1 if power <= 0
    mid = expon_2(base, (power / 2))
    if power % 2 == 0
        mid * mid
    else
        base * mid * mid
    end
end



# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

class Array
    def deep_dup
        solved = []
        self.each do |ele|
            if ele.is_a?(Array)
                solved << ele.deep_dup
            else
                solved << ele
            end
        end
        solved
    end
end


def recurs_fib(num)
    return [] if num == 0
    return [0] if num == 1
    return [0,1] if num <= 2
    seq = recurs_fib(num-1)
    seq << seq[-2] + seq[-1]
end

def iter_fibs(num)
    solved = [0, 1]
    (0...num-2).each { |n| solved << solved[-2] + solved[-1] }
    solved
end

def b_search(arr, value)
    return nil if arr.empty?   
    middle = arr.length / 2
    if arr[middle] < value
        result = b_search(arr[(middle+1)..-1],value)
        result ? middle + 1 + result : nil
    elsif arr[middle] > value
        b_search(arr[0...middle],value)
    else
        return middle
    end
end

# p b_search([1,2,3,4,5], 4)

# p b_search([1, 2, 3], 1) # => 0
# p b_search([2, 3, 4, 5], 3) # => 1
# p b_search([2, 4, 6, 8, 10], 6) # => 2
# p b_search([1, 3, 4, 5, 9], 5) # => 3
# p b_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p b_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p b_search([1, 2, 3, 4, 5, 7], 6) # => nil

# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. 
# Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, 
# watch this gif and check out this diagram.


def merge_sort(arr)
    return arr if arr.length <= 1
    mid = (arr.length / 2)
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..-1])
    merge(left,right)
end

def merge(left,right)
    if left.empty?
        right
    elsif right.empty?
        left
    elsif left.first < right.first
        [left.first] + merge(left[1..left.length],right)
    else
        [right.first] + merge(left, right[1..right.length])
    end
end


# p merge_sort [1,3,7,4,8,2,18,29,33,77,77,64,3,3]

# Array Subsets
# Write a method subsets that will return all subsets 
# of an array.


def subsets(arr)
    return [] if arr.empty?
    subs = []
    subs = [arr[0]] + subsets(arr[1..-1])
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.
# Permutations
