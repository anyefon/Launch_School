def fibonacci(n)
  first = 1
  second = 1
  fibonacci = 0

  3.upto(n) do |i|
    fibonacci = first + second
    first = second
    second = fibonacci
  end

  fibonacci
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001).digits.size # => 4202692702.....8285979669707537501

# Further Exploration

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last] # adds two new fib numbers each iteration
  end

  last
end

def fibonacci(n)
  array = []
  n.times { array.length < 2 ? array << 1 : array << array[-2..-1].sum }
  array.last
end

def sum(num)
  result = [1, 1]

  loop do
   break if result.size == num || num < 2

   first_num, last_num = result[-2], result[-1]
   nums_added = first_num + last_num

   result << nums_added 
  end

p result.last
end
