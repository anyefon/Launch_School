=begin
Move the first letter of each word to the end of it, then add "ay" to the end of the word.
Leave punctuation marks untouched.

Examples
pig_it('Pig latin is cool') # igPay atinlay siay oolcay
pig_it('Hello world !')     # elloHay orldway !

input:
-a string
output:
-a string with 'ay' added at the end

rules:
-punctuation marks should remain in place

algorithm
-split string into substrings and place them in array
-for each substring in array, map to new array 
  -if substring is not a letter, return it unmodified
  -elseif last character of string is a punctuation mark
    -concatenate the first letter to the second to the last position, add 'ay' and then append the punctuation mark
  -else
    -have the first letter of string concatenated to the end of string
  -join substrings with a space.
=end

def pig_it text
  # ...
  text.split.map do |str|
    if str.match(/[^a-zA-Z]/)
      str
    elsif str[-1].match(/[^a-zA-Z]/)
      str[1..-2] + str[0] +'ay' + str[-1]
    else
      str[1..-1] + str[0] + 'ay'
    end
  end
  .join(' ')
end

p pig_it('Pig latin is cool') # igPay atinlay siay oolcay
p pig_it('Hello world !')     # elloHay orldway !
