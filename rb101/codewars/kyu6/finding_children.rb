=begin
Mothers arranged a dance party for the children in school. At that party, there are only mothers 
and their children. All are having great fun on the dance floor when suddenly all the lights went out.
It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark
 and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children
 are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, 
i.e. "aAbaBb" => "AaaBbb".
input:
-a shuffled string
output:
-a string with capital and lowercase letters ordered with uppercase letters coming first
rules:
- uppercase letters are unique(mothers) while lowercase letters can be more than one

algorithm:
-create a hash family variable
-scan the string and obtain all capitals in an array and assign it to a capitals variable
-for each char in capitals,
  - input hsh[char] = char
-for each letter in input string
  - hsh[letter.upcase] << letter
-obtain an array of values from the hash and join without space

=end

# def find_children(dancing_brigade)
#   #your code here
#   family = {}
#   capitals = dancing_brigade.scan(/[A-Z]/).sort

#   capitals.each{|capital| family[capital] = capital}
#   dancing_brigade.each_char do |char|
#     family[char.upcase] << char if char.match(/[a-z]/)
#   end
#   family.values.sort.join
# end

def find_children(dancing_brigade)
  dancing_brigade.chars.sort_by { |char| [char.downcase, char] }.join
end
puts find_children("AaaaaZazzz")
puts find_children("CbcBcbaA")
puts find_children("xXfuUuuF")