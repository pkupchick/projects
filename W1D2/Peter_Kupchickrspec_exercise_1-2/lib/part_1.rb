def average(num_1, num_2)
    sum = num_1 + num_2
    return sum / 2.0
end

def average_array(arr)
   return arr.sum / arr.length.to_f
end

def repeat(str, num_1)
   return str * num_1
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    solved = []
    array = str.split(" ")
    array.each_with_index do |word, i|
        if i % 2 == 0
            solved << word.upcase
        else
            solved << word.downcase
        end
    end
    return solved.join(" ")
end