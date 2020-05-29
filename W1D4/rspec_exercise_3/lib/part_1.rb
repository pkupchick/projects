def is_prime?(num)
    return false if num < 2
        (2...num).each do |factor|
            if num % factor == 0
                return false
            end
        end
        return true
end

def nth_prime(num)
    solved = []
        i = 2
            while solved.length < num
                solved << i if is_prime?(i)
                i += 1
            end
    solved.max
end

def prime_range(min, max)
    solved = []
        (min..max).each do |num|
            solved << num if is_prime?(num)
        end
    solved
end

