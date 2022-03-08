=begin
Create a moreZeros function which will receive a string for input, and return an array 
(or null terminated string in C) containing only the characters from that string whose binary 
representation of its ASCII value consists of more zeros than ones.

You should remove any duplicate characters, keeping the first occurence of any such duplicates, 
so they are in the same order in the final array as they first appeared in the input string.

Examples

'abcde' === ["1100001", "1100010", "1100011", "1100100", "1100101"]
               True       True       False      True       False
                   
        --> ['a','b','d']
    
'DIGEST'--> ['D','I','E','T']
All input will be valid strings of length > 0. Leading zeros in binary should not be counted.

input:
-a string
output:
- an array of characters from input string whose binary representation of its ASCII value consists of 
more zeros than ones.

rules:
-all input will be valid strings of length > 0
-leading zeros in binary should be neglected.
- case sensitive

algorithm:
- create array of characters
-transform string into array of characters
-for each char in array,
  -get the ascii equivalent
  -if ascii value starts with 0
    -delete it
  -count ones and zeros and compare the number
    -append character to array of characters if zeros more than ones provided array does not have character
-return array
=end

=begin
# a better solution
def more_zeros(s)
  s.chars.uniq.select { |c| (bin = c.ord.to_s(2)).count("0") > bin.count("1") }
end
=end

def more_zeros(s)
  chars = []

  s.chars.each do |char|
    bit_value = char.ord.to_s(2)

    bit_value = bit_value[1..-1] if bit_value[0] == '0'
    
    if bit_value.count('0') > bit_value.count('1')
      chars << char if !(chars.include?(char))
    end
  end
  chars
end