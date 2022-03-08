=begin
Acknowledgments:
I thank yvonne-liu for the idea and for the example tests :)

Description:
Encrypt this!

You want to create secret messages which can be deciphered by the Decipher this! kata. Here are the conditions:

Your message is a string containing space separated words.
You need to encrypt each word in the message using the following rules:
The first letter must be converted to its ASCII code.
The second letter must be switched with the last letter
Keepin' it simple: There are no special characters in the input.
Examples:
encrypt_this("Hello") == "72olle"
encrypt_this("good") == "103doo"
encrypt_this("hello world") == "104olle 119drlo"

algorithm:
-break up the string at the spaces
-for a substring in resulting array
  -replace first letter by its ascii equivalent
  -substring = substring[0] + substring[-1] + substring[2..-2] + substring[1]
-join string with space
=end

def encrypt_this(text)
  # your code here
  text.split.map do |str| 
    if str.size == 1
      str[0].ord.to_s
    elsif str.size == 2
      str[0].ord.to_s + str[-1]
    else
      str[0].ord.to_s + str[-1] + str[2..-2] + str[1]
    end
  end.join(" ")
end