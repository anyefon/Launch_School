# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Examples:

# pseudocode

# - input
#    array of integers
# - output
#   symbols
#
#   Algorithm
# - sort array
# - if subarray of first two elements is greater than last elt and if array does not contain zero
#   - if count of middle elt arr[1] is 3
#       then it is equilateral
#   - if count of middler elt arr[1] is 2
#       then it is isosceles
#   - if count of arr[1] is 1
#       then it is scalene
# - else it is an invalid triangle

def triangle(a, b, c)
  arr = [a, b, c].sort

  if arr[0..-2].sum > arr[-1] && arr.count(0) == 0
    if arr.count(arr[1]) == 3
      :equilateral
    elsif arr.count(arr[1]) == 2
      :isosceles
    else 
      :scalene
    end
  else
    :invalid
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid