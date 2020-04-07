def oddities(arr)
  arr.select {|item| arr.index(item) % 2 == 0}
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Further exploration
def evenities(arr)
  arr.select {|item| arr.index(item) % 2 ==  1}
end 


puts evenities([2, 3, 4, 5, 6]) == [3, 5]
puts evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evenities(['abc', 'def']) == ['def']
puts evenities([123]) == []
puts evenities([]) == []