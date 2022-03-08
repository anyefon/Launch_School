arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  break if counter == arr.size - 1
  counter += 1
end

puts sum