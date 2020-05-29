def partition(arr, num)
    solved = Array.new(2) { [] }
        arr.each do |ele|
            if ele < num
                solved[0] << ele
            else
                solved[1] << ele
            end
        end
    solved
end

def merge(hash1, hash2)
    solved = Hash.new(0)
    hash1.each { |k, v| solved[k] = v }
    hash2.each { |k, v| solved[k] = v }
    solved
end

def filter(word)
    vowels = "aeiouAEIOU"
    i = 0
        while i <= word.length - 1
            if vowels.include?(word[i])
                word[i] = "*"
            end
            i += 1
        end
    word
end

def censor(sent, curses)
    words = sent.split
    words.map do |word|
        if curses.include?(word.downcase)
            filter(word)
        end
    end
    words.join(" ")
end

def power_of_two?(num)
    return true if num == 1
    (2...num).each do |n|
        return true if 2 ** n == num
        return false if 2 ** n > num
    end
end