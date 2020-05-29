def sum_to(n)
    return 1 if n == 1
    sum_to(n - 1) + n
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45

def add_numbers(arr)
    return arr[0] if arr.length <= 1
    arr[0] + add_numbers(arr[1..-1])
end

  # Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil


# EXERCISE 3

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1

  (num - 1) * gamma_fnc(num - 1)
end

# Test Cases:
  # p gamma_fnc(0)  # => returns nil
  # p gamma_fnc(1)  # => returns 1
  # p gamma_fnc(4)  # => returns 6
  # p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, fave)
    return "no" if flavors.empty?
    return "yes" if flavors.last == fave
    ice_cream_shop(flavors[0...-1], fave)
end


# Test Cases
# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(str)
    return "" if str.length == 0
    reverse(str[1..-1]) + str[0]
end


  # Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""