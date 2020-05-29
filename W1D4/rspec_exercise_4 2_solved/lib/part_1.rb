def my_reject(array, &prc)
    array.select do |ele|
        !prc.call(ele)
    end
end

def my_one?(arr, &prc)
    arr.select { |ele| prc.call(ele) }.length == 1
end

def hash_select(hash, &prc)
    new_hash = Hash.new(0)
    hash.each do |k,v|
        new_hash[k] += v if prc.call(k,v) 
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    arr.select do |ele| 
        (prc1.call(ele) && !prc2.call(ele)) || (prc2.call(ele) && !prc1.call(ele))
    end
end

def proc_count(val, array)
    count = 0
    array.each do |proc|
        count += 1 if proc.call(val)
    end
    count
end

