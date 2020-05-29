def element_count(arr)
    solved = Hash.new(0)
        arr.each do |ele|
            solved[ele] += 1
        end
    solved
end

def char_replace!(str, hash)
    i = 0
        while i <= str.length - 1
            if hash.has_key?(str[i])
                str[i] = hash[str[i]]
            end
            i += 1
        end
    str
end

def product_inject(arr)
    arr.inject { |accu, ele| accu * ele }
end