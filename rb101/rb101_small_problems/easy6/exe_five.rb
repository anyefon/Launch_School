def reverse(arr)
  reversed_arr = arr.sort_by do |element|
    0 - arr.index(element)
  end
  reversed_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true
puts 
p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]  

# def reverse(array)
#   array.each_with_object([]) { |i, a| a.unshift(i) }
# end