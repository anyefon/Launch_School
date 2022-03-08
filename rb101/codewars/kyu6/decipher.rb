=begin
You are given a secret message you need to decipher. Here are the things you need to know to 
decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

input:
-an encrypted string(alphanumerics)
output:
-a decrypted string
algorithm:
-create an array of capital letters from 'A'..'Z', do the same for lowercase letters 'a'..'z'
-break string up and for each string
  -scan string for numerics, convert string to a number
  -if number is less than 96
    -then substract 65 from number to get index of letter in capitals array
    -substitute numerics in string with letter obtained above
  -else
    -then substract 97 from number to get index of letter in lowercase array
    -substitute numerics in string with letter obtained above
  -swap the second and last characters
-join strings with space
  
=end
require 'pry'
def decipher_this(string)
  capitals = ('A'..'Z').to_a
  lowercases = ('a'..'z').to_a
  
  string.split.map do |str|
    num = str.scan(/\d+/).last.to_i
 
    if num < 96
      capital_index = num - 65
      str = str.gsub(/\d+/, capitals[capital_index])
    else
      lowercase_index = num - 97
      str = str.gsub(/\d+/, lowercases[lowercase_index])
    end

    str[0]+ str[-1] + str[2..-2] + str[1] if str.length > 2
  end.join(" ")
end

puts decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka")