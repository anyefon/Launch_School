=begin
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

Good luck :)

input:
-a string 
output:
-longest alphabetical substring
rules:
-input will have lowercase characters and will be at least one letter long
-if there are multiple solutions, return the one that appears first

algorithm:
-create a hash called substrings to house the various substrings and their lengths
-create a string called substring
-for each char in input string
  - if char is first character in input string
    -append char to substring
  - elsif ascii value of char is greater than last item in substring
    -append char to substring
  - else
    -substrings[substring] = substring.length
    -substring = char
-for the last element(s), substrings[substring] = substring.length
-return the key of hash with the maximum value
=end

def longest(s)
  # your code here
  substrings = {}
  sub_str = ""

  s.chars.each_with_index do |char, index|
    if char == s[0]
      sub_str << char
    elsif char.ord > s[index - 1].ord 
      sub_str << char
    else
      substrings[sub_str] = sub_str.length
      sub_str = char
    end
  end
  substrings[sub_str] = sub_str.length
  substrings.key(substrings.values.max)
end

p longest('asd')