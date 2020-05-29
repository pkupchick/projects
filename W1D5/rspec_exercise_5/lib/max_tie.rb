def my_group_by(arr)
    access = {2=>["a", 10], 3=>["b", 11], 4=>["c", 12], 5=>["d", 13], 6=>["f", 14]}
    length = access[0][1].length
    solved = []
    (0...length).each do |i|
         access.each do |k, v|
            solved << access[k][i]
         end
        end
        solved

end


p my_group_by([2, 3, 4, 5, 6])