=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go 
for a short walk. The city provides its citizens with a Walk Generating App on their phones -- 
everytime you press the button it sends you an array of one-letter strings representing directions to 
walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and 
you know it takes you one minute to traverse one city block, so create a function that will return true
if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) 
and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters 
('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing 
still!).

input:
-an array of directions
output:
-a true/false boolean
rules:
-each letter in array represents a direction
-walk each single block for each direction and it takes one minute
-your walk should be for exactly ten minutes, that is ten directions in array
algorithm:
-check if array has exactly ten elements. return false if otherwise
-create a hsh where 'n' has value 1, 's' has value -1, 'w' has value 1, 'e' has value -1
-create an empty array called directions
-iterate through given array
  -obtain integer equivalent from hash for given char and append it to directions array
-if sum of directions array is 0, return true else return false
=end

def is_valid_walk(walk)
  #your code here
  hsh = {'n' => 1, 's' => -1, 'w' => 1, 'e' => -1}
  directions = []

  return false if walk.length != 10
  walk.each do |letter|
    directions << hsh[letter]
  end
  directions.sum == 0 ? true : false
end

# def isValidWalk(walk)
#   walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w') && walk.count == 10
# end