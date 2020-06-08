#phase 1

def anagram?(str_1, str_2)
    letters_1 = str_1.split("")
    letters_2 = str_2.split("")
    possible = letters_1.permutation(str_1.length).to_a
    possible.include?(letters_2)
end

# p anagram?("gizmo", "sally")
# p anagram?("elvis", "lives")

#phase 2
def anagram_1?(str_1, str_2)
    letters_1 = str_1.split("")
    letters_2 = str_2.split("")
    letters_1.each do |char|
        index = letters_2.find_index(char)
        letters_2.delete_at(index) if !index.nil?
    end
    letters_2.empty?
end

# p anagram_1?("gizmo", "sally")
# p anagram_1?("elvis", "lives")

def anagram_2?(str_1, str_2)
    one = str_1.split("")
    two = str_2.split("")
    one.sort == two.sort
end



# p anagram_2?("gizmo", "sally")
# p anagram_2?("elvis", "lives")

def char_count(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count
end

def anagram_3?(str_1, str_2)
    char_count(str_1) == char_count(str_2)
end

# p anagram_3?("gizmo", "sally")
# p anagram_3?("elvis", "lives")

def anagram_4?(str_1, str_2)
    hash1 = char_count(str_1)
    str_2.each_char { |char| hash1[char] -= 1 }
    hash1.each_value.all? { |total| total == 0 }
end


p anagram_4?("gizmo", "sally")
p anagram_4?("elvis", "lives")