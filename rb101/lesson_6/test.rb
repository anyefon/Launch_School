Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Input
# - string

# Output
# - string (different object)
#   - contains only alpha chars
#   - in alphabetical order of appearance

# Algorithm
# - initialize a var `result` and assign it to an empty array
# - substitute whitespace of input string with '' and reassign 
# - iterate through char array of the string
#   - if char belongs to alpha chars
#     - push the char to the `result` array
# - sort the array
#   - sort it based on a lowercase version of this array (sort_by)
#   

def alphabetized(string)
  result = []
  string = string.gsub(' ', '')
  
  string.chars.each do |char|
    result.push(char) if char =~ /[a-z]/i
  end
  
  result.sort_by { |char| char.downcase }.join
  
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"