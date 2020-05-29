def partition(arr, num)
    less = []
    greater = []
        arr.each do |ele|
            if ele < num
                less << ele
            else
                greater << ele
            end
        end
    [less, greater]
end

def merge(hash_1, hash_2)
    hash = Hash.new(0)
    hash_1.each {|k,v| hash[k] = v}
    hash_2.each {|k,v| hash[k] = v}
    hash
end

def swapper(word)
    word.gsub(/[aeiouAEIOU]/,"*")
end

def censor(str, arr)
    words = str.split(" ")
    solved = []
    words.each do |word|
        if arr.include?(word.downcase)
            solved << swapper(word)
        else
            solved << word
        end
    end
    solved.join(" ")
end

def power_of_two?(num)
    return true if num == 1
    (2...num).each do |n|
        return true if 2 ** n == num
        return false if 2 ** n > num            
    end
end
