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
    arr.select { |ele| prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele) }
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
    return nil if arr.empty?
    solved = Hash.new(0)
        arr.each do |ele|
            solved[ele] = prc.call(ele)
        end
    temp = solved.sort_by {|k,v| v}
    temp[-1][0]
end

def my_group_by(arr, &prc)
    solved = Hash.new() { |h, v| h[v] = [] }
        arr.each do |ele|
            solved[prc.call(ele)] << ele
        end
    solved
end

def max_tie_breaker(arr, tie, &blc)
    return nil if arr.empty?
    champ = arr.first
        arr.each do |ele|
            contender1 = blc.call(ele)
            contender2 = blc.call(champ)
            if contender1 > contender2
                champ = ele
            elsif contender1 == contender2 && tie.call(ele) > tie.call(champ)
                champ == ele
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
        word.each_char do |char|
            count += 1 if vowels.include?(char)
        end
    count
end

def first_vowel(word)
    i = 0
    vowels = "aeiouAEIOU"
        while i <= word.length - 1
            return word[i..-1] if vowels.include?(word[i])
            i += 1
        end
end

def last_vowel(word)
    i = word.length - 1
    vowels = "aeiouAEIOU"
        while i >= 0
            return word[0..i] if vowels.include?(word[i])
            i -= 1
        end
end