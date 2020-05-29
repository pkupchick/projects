def hipsterfy(word)
    vowels = "aeiou"

    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[(i+1)..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    res = Hash.new(0)
    vowels = "aeiou"
    copy_str = str.downcase
    copy_str.each_char do |c|
        (res[c] += 1) if vowels.include?(c)
    end
    res
end

def caesar_cipher(str, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
        str.each_char.with_index do |char, i|
                if alpha.include?(char)
                    old_idx = alpha.index(char)
                    new_idx = (old_idx + num) % alpha.length
                    str[i] = alpha[new_idx]
                end
        end
    str
end