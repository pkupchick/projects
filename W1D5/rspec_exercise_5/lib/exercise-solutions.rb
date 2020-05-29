def zip(*arr)
    solved = Array.new(arr.first.length) { [] }
        (0...arr.first.length).each do |i|
            arr.each do |ele|
                solved[i] << ele[i]
            end
        end
    solved
end

def prizz_proc(arr, prc1, prc2)
    solved = []
    arr.each do |ele|
        if prc1.call(ele) && !prc2.call(ele) || prc2.call(ele) && !prc1.call(ele)
            solved << ele
        end
    end
    solved
end

def zany_zip(*arr)
    lengths = arr.map { |sub| sub.length }
    solved = Array.new(lengths.max) { [] }
        (0...lengths.max).each do |i|
            arr.each do |ele|
                solved[i] << ele[i]
            end
        end
    solved
end

def maximum(arr, &prc)
    return nil if arr == []
    solved = Hash.new(0)
        arr.each do |ele|
            if prc.call(ele)
            solved[ele] = prc.call(ele)
            end
        end
    temp = solved.sort_by {|k, v| v}
    temp[-1][0]
end

def my_group_by(arr, &prc)
    new_hash = Hash.new() {|h, k| h[k] = []}
        arr.each do |ele|
            new_hash[prc.call(ele)] << ele
        end
    new_hash
end

def max_tie_breaker(arr, tie, &blk)
    return nil if arr == []
    champ = arr[0]
        arr.each do |ele|
            contender1 = blk.call(ele)
            contender2 = blk.call(champ)
            if contender1 > contender2
                champ = ele
            elsif contender1 == contender2 && tie.call(ele) > tie.call(champ)
                champ = ele
            end
        end
    champ
end

def silly_syllables(sent)
    words = sent.split
    solved = []
        words.each do |word|
            if vowel_count(word) >= 2
                step1 = first_vowel(word)
                solved << last_vowel(step1)
            else
                solved << word
            end
        end
    solved.join(" ")
end

def vowel_count(word)
    count = 0
    vowels = "aeiouAEIOU"
    word.each_char { |char| count += 1 if vowels.include?(char) }
    count
end

def first_vowel(word)
    vowels = "aeiouAEIOU"
    i = 0
        while i <= word.length
            if vowels.include?(word[i])
              return word[i..-1]
            end
            i += 1
        end

end

def last_vowel(word)
    vowels = "aeiouAEIOU"
    i = word.length - 1
        while i >= 0
            if vowels.include?(word[i])
                return word[0..i]
            end
            i -= 1
        end
end