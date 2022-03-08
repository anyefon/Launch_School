
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last] # adds two new fib numbers each iteration
  end

  last
end

def fibonacci_last(nth)
  last = fibonacci(nth)

  last.to_s[-1].to_i
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4

# Further Exploration

# This function shows the repeating pattern (or periodicity) is size 60
def last_fibonacci_digits
  first, last = [1, 1]
  1000.times do |n|
    first, last = [last, (first + last) % 10]
    print "#{last} "
    puts '' if n % 60 == 0
  end
end

# Uncomment the following call to see the pattern for yourself
# last_fibonacci_digits

# Run this to get the last digit of the nth Fibonacci!
def last_fibonacci_digit(n)  
  # The pattern starts with the 4th number, since 1, 1, 2 are the first 3.
  # This means that index n of the below corresponds to the n+4th Fibonacci.
  repeating_pattern = %w[3 5 8 3 1 4 5 9 4 3 7 0 7 7 4 1 5 6 1 7 
                      8 5 3 8 1 9 0 9 9 8 7 5 2 7 9 6 5 1 6 7 
                      3 0 3 3 6 9 5 4 9 3 2 5 7 2 9 1 0 1 1 2]

  repeating_pattern[(n-4) % 60]
end

puts last_fibonacci_digit(123_456_789_987_745)  