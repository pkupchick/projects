
def my_unique(arr)
    arr.uniq
end

# p my_unique([1,1,4,4,3])

def two_sum(arr)
    solved = []
    arr.each_with_index do |ele_1, idx_1|
        arr.each_with_index do |ele_2, idx_2|
            if ele_1 + ele_2 == 0 && idx_2 > idx_1
                solved << [idx_1, idx_2]
            end
        end
    end
    solved
end

# p two_sum([2, 3, 4, -2, 1, 6, -3])

def my_transpose(arr)
    arr.transpose
end

arr = [100, 110, 98, 120, 200]

def my_stock_picker(arr)
    champ = arr[1] - arr[0]
    days = []
    arr.each_with_index do |ele_1, idx_1|
        arr.each_with_index do |ele_2, idx_2|
            cont = ele_1 - ele_2
            if champ < cont
                champ = cont
                days = [idx_2, idx_1]
            end
        end
    end
    # champ
    days
end

# p my_stock_picker([100, 110, 98, 120, 200])

