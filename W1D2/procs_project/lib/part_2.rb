def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    words.each_with_index do |word, i|
        words[i] = prc.call(word)
    end
    return words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    value1 = prc1.call(num)
    value2 = prc2.call(num)
    [value1, value2].max
end

def and_selector(arr, prc1, prc2)
    new_array = []
        arr.each do |ele|
            new_array.push(ele) if prc1.call(ele) && prc2.call(ele)
        end
    new_array
end

def alternating_mapper(arr, prc1, prc2)
    new_array = []
        arr.each_with_index do |ele, i|
            if i.even? 
                new_array.push(prc1.call(ele))
            else 
                new_array.push(prc2.call(ele))
            end
        end
    new_array
end