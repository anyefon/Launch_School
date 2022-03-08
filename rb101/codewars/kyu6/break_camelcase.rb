=begin
Complete the solution so that the function will break up camel casing, using a space between words.

Example
"camelCasing"  =>  "camel Casing"
"identifier"   =>  "identifier"
""             =>  ""
input:
-string in camel casing
output:
-string with camel casing separated by a space
test cases:
-string with more than two camelCasing strings
algorithm:
-create a new string camel_casing
-for each char in input string
  -if char is a capital letter
    - concatenate a space infront of capital letter and append to camel_casing string
  -else append char to camel_string 
-join chars with no spacing
=end


# def solution(string)
#   # complete the function
#   camel_casing = ""

#   string.each_char do |char|
#     if char.match(/[A-Z]/)
#       camel_casing << " " + char 
#     else 
#       camel_casing << char
#     end
#   end
#   camel_casing
# end

# clever solution
def solution(string)
  string.gsub(/(?=[A-Z])/, ' ')
end

puts solution('camelCasing')
puts solution('camelCasingTest')