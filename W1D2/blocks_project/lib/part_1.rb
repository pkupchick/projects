def select_even_nums(arr)
    new_arr = arr.select { |num| num.even? }
end

def reject_puppies(arr)
   arr.reject { |hash| hash["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiou"
    new_str = ""
    str.each_char do |char|
        if vowels.include?(char)
            new_str += char + "b" + char
        else
            new_str += char
        end
    end
    new_str
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end

