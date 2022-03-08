def fibonacci(nth)
  if nth < 2
      nth
  else
      nth = fibonacci(nth -1) + fibonacci(nth - 2)
  end
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765