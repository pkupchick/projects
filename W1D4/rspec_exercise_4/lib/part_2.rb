def my_reject(arr, &prc)
    solved = []
        arr.each do |ele|
            if !prc.call(ele)
                solved << ele
            end
        end
    solved
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele)}
    count == 1
end