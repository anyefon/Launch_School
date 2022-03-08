=begin
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new 
string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and 
punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english 
alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"

input:
string, no numerals 
output:
case-insensitively-alphabetical-order-of-appearance order

algorithm
-create a string of arrays from the given string and assign it to a variable str_arr
-sort the array based on the lowercase ASCII value
-join the characters in the array
-substitute non alphabetical characters with an empty string

=end

def alphabetized(s)
  #your code here
  s.chars.sort_by{|chr| chr.downcase}.join.gsub(/[^a-zA-Z]/, "")
end

puts alphabetized("The Holy Bible") == "BbeehHilloTy"
puts alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"