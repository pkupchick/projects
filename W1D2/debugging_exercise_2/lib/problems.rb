# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    num.downto(1).each do |divisor|
        if num % divisor == 0 && isprime?(divisor)
            return divisor
        end
    end
    return 1
end

def isprime?(n)
    if n < 2 
        return false
    end
    (2...n).each do |factor|
        if n % factor == 0
            return false
        end
    end
        return true
end

def unique_chars?(str)
    duplicates = Hash.new(0)
    str.each_char do |c|
        duplicates[c] += 1
    end
    duplicates.each do |key,val|
        if val > 1
            return false
        end
    end
    true
end

def dupe_indices(arr)
    hsh = Hash.new(Array.new())
    arr.each_with_index do |ele, idx|
        hsh[ele] += [idx]
    end
    hsh.each do |k, v| 
        if v.length < 2
            hsh.delete(k)
        end
    end
    hsh
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    arr1.each do |ele|
        return false if !arr2.include?(ele)
    end
    arr2.each do |ele|
        return false if !arr1.include?(ele)
    end
    true
end
