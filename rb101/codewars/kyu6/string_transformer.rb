=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

input:
-a string
output:
-a string with all cases inversed
rules:
-method should be able to handle multiple spaces, leading/trailing spaces
algorithm:
-create an empty array arr
-create a string string
-for each char in string
  -if char is upcased
    -change to downcase
  -else
    -change to upcase
  -if char is a space
    -arr append char and string to front of array
    -string = ""
  -else
    -append char to end of string
-arr.join("")
=end
def string_transformer(str)
  # Your code here
  arr = []
  string = ""

  str.each_char do |char|
    if ('A'..'Z').include?(char)
      char = char.downcase
    else
      char = char.upcase
    end
    
    if char.match(/[^a-zA-Z]/)
      arr.unshift(string).unshift(char)
      string = ""
    else
      string << char
    end
  end
  arr.unshift(string)
  arr.join("")
end


# def string_transformer(str)
#   str.split(/\b/).reverse.map(&:swapcase).join
# end