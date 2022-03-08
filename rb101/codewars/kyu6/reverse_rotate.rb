=begin
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the 
initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse 
that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and 
return the result as a string.

If

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"
Example of a string rotated to the left by one position:
s = "123456" gives "234561".

input:
- a string and number representing the chunk size
output:
- a reversed/rotate string
rules:
-ignore (drop it ) the second chunk if its size is less than sz
-if sz is <= 0 or if str is empty return "" or if sz is greater than the length of str return ""

algorithm:
-create an array substrings
- if sz is <= 0 or str is empty or sz is greater than the length of str return ""
****helper method, break_string*************************
-create a variable substring
-create arr
-for each_char in string
  -if substring length is less than sz
    - append char to substring
  -else
    - push substring into arr
    - reassign substring to empty string
-return arr to main method and assign to substrings array
*********************************************************
sum_cubes
-create a variable sum assigned to 0
-for each char in string
  -convert to integer, raise it to the power 3
  -and add the result to the sum
-return the sum
********************************************************
-for each elt in substrings
  - if sum_cubes is divisible by 2
    - reverse the elt
  - else
    - the first char of elt and append it to the back of elt
-join the resulting array with no spaces
=end

def break_string(str, sz)
  substring = ""
  arr = []

  str.each_char do |char|
    if substring.length < sz
      substring << char
    else
      arr << substring
      substring = char
    end
  end
  arr << substring if substring.length == sz
  arr
end

# p break_string("123456987654", 6)
# p break_string("563000655734469485", 4)
def sum_cubes(string)
  sum = 0

  string.each_char do |char|
    sum += char.to_i ** 3
  end
  sum
end

# p sum_cubes('123')


def revrot(str, sz)
  # your code
  substrings = []
  return "" if sz <= 0 || str.length == 0 || sz >= str.length
  substrings = break_string(str, sz)

  substrings.map do |substring|
    if sum_cubes(substring) % 2 == 0
      substring.reverse
    else
      substring[1..-1] + substring[0]
    end
  end.join("")
end

puts revrot("733049910872815764", 5) == "330479108928157"