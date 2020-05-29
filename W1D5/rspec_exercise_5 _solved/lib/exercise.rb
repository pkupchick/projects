require 'byebug'

def zip(*arr)
    new_arr = Array.new(arr.first.length) { [] } # -> [[1,3],[2,4]]
        (0 ... arr[0].length).each do |i|
            arr.each do |ele|
                new_arr[i] << ele[i]
            end
        end
    new_arr
end 


# def zip(*arr)
#     # length = arr.first.length
#     # (0...length).map do |idx| 
#     #     arr.map do |sub| 
#     #         arr[idx]
#     #     end 
#     # end 
#     length = arr.first.length
#     new_arr = Array.new(length, [])
#         arr.each do |sub|
#             arr.each do |ele|
#                 new_arr << ele
#             end
#         end
#     new_arr
# end 
=begin
new_arr = Array.new(3, []) # => [[],[],[]]
new_arr[0] = 1 [[1], [], []]
Array.new(3) { [] }
max_arr = arr.max { |ele| ele.length}
max_arr.length # num 
max_arr = arr.max { |ele| ele.length }.length # num 
Array.new(3) { Array.new(4, nil) }
=end
def prizz_proc(arr, prc1, prc2)
    solved = []
        arr.each do |ele|
            if prc1.call(ele) && !prc2.call(ele)
                solved << ele
            elsif prc2.call(ele) && !prc1.call(ele)
                solved << ele
            end
        end
    solved
end

def zany_zip (*arr)
    lengths = arr.map { |sub| sub.length }
    new_arr = Array.new(lengths.max) { [] } # -> [[1,3],[2,4]]
    (0 ... lengths.max).each do |i|
        arr.each do |ele|
            new_arr[i] << ele[i]
        end
    end
    new_arr
end 

def maximum(arr, &prc)
    items = Hash.new(0)
    return nil if arr == []
    arr.each do |ele|
       items[ele] = prc.call(ele)
    end
  temp = items.sort_by { |k, v| v}
  temp[-1][0]
end

def my_group_by(arr, &prc)
    hash = Hash.new { |k, v| hash[v] = [] }
    # hash = Hash.new(0)
    arr.each do |ele| 
        # key = prc.call(ele)
        hash[prc.call(ele)] << ele 
    end 
    # arr.each do |ele|
    #     hash[prc.call(ele)] << ele
    # end
    hash
end 

def max_tie_breaker(arr, tie, &blc)
      return nil if arr.empty?
    curr = arr[0]
    arr.each do |ele|
        result1 = blc.call(ele)
        result2 = blc.call(curr)
        if result1 > result2 
            curr = ele
        elsif result1 == result2 && tie.call(ele) > tie.call(curr) # tie
            curr = ele
        end
    end
    curr 
end

def silly_syllables(sent)
    words = sent.split(" ")
    solved = []
    words.each do |word|
        if vowel_count?(word) >= 2
            step1 = wordfixer1(word)
            solved << wordfixer3(step1)
        else 
            solved << word
        end
    end
    solved.join(" ")
end

def vowel_count?(word)
    count = 0
    vowels = "aeiouAEIOU"
    word.each_char do |char|
        if vowels.include?(char)
            count += 1
        end
    end
    count
end

def wordfixer1(word)
    fixed = []
     vowels = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_word = word[i..-1]
            fixed << new_word
            break
        end
    end
    fixed.join("")
end

# def wordfixer2(word)
#     fixed = []
#      vowels = "aeiouAEIOU"
#      backwards = word.reverse
#     backwards.each_char.with_index do |char, i|
#         if vowels.include?(char)
#             new_word = word[0...i]
#             fixed << new_word
#             break
#         end
#     end
#     backwards
# end

def wordfixer3(word)
    fixed = []
     vowels = "aeiouAEIOU"
    i = word.length - 1
        while i > 0
            char = word[i]
            if vowels.include?(char)
                new_word = word[0..i]
                fixed << new_word
                break
            end
            i -= 1
        end
    fixed.join("")
end
