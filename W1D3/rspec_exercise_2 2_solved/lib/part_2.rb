def palindrome?(str)
    new_str = ""
    i = str.length - 1
    while i >= 0 
      new_str += str[i]
      i -= 1
    end
    str == new_str
end

def substrings(string)
    subs = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      subs << string[start_idx..end_idx]
    end
  end
  subs
end

def palindrome_substrings(str)
    substrings(str).select { |sub| sub.length > 1 && palindrome?(sub) }
end
