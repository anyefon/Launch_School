# Tri-Angles
# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

# - input 
#   three angles
# - output
#   symbol representing angle

# Algorithm
# - Assign angles to an array 'angles'
# - sort angles array
# - if sum of angles is 180 and count of zero on array is 'zero'
#   - if arr[-1] is less than 90 
#      then :acute
#   - if arr[-1] is equal to 90
#      then :right
#   - if arr[-1] greater than 90
#      then :obtuse
# - else 
#   invalid

def triangle(a, b, c)
  arr = [a, b, c].sort

  if arr.sum == 180 && arr.count(0) == 0
    if arr[-1] < 90
      :acute
    elsif arr[-1] == 90
      :right
    else
      :obtuse
    end
  else
    :invalid
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
