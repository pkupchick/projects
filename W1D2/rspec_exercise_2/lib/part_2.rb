def palindrome?(str)
    backwards = ""
        i = str.length - 1
        while i >= 0
            backwards += str[i]
            i -= 1
        end
    backwards == str
end

def substrings(str)
    solved = []
        (0...str.length).each do |start_idx|
            (start_idx...str.length).each do |end_idx|
                solved << str[start_idx..end_idx]
            end
        end
    solved
end

def palindrome_substrings(str)
    substrings(str).select { |sub| sub.length > 2 && palindrome?(sub) }
end