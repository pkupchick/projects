def proper_factors(num)
    (1..num / 2).to_a.select { |factor| num % factor == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    perfect = []
    i = 1
    while perfect.length < n
         perfect << i if perfect_number?(i)
         i += 1
    end
    perfect
end