def multiply(num1, num2)
  [num1, num2].inject(:*)
end

puts multiply(5, 3) == 15 # true
p multiply([5], 4) # [5, 5, 5, 5]