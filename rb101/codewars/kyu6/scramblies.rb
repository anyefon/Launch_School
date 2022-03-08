=begin
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can 
be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.
Examples
scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False

input:
-string
output:
-a boolean 
rules:
-only lowercase letters will be used
-returns true if a portion of string str2 is found in str1
-no punctuation or digits will be included
algorithm:
-break str2 into characters and place into array
-create a boolean and assign it a value of true
-for each value in str2
  -if char from str2 is present in str1
    -do nothing
  -else
    -change boolean to false
-return the boolean value
=end

# def scramble(s1,s2)
#   #your code here
#   switch = true
  
#   s2.each_char do |char|
#     if s2.count(char) <= s1.count(char)
#       true
#     else
#       switch = false
#     end
#   end
#   switch
# end
#******better solution*****
def scramble(s1,s2)
  s2.chars.uniq.all?{|x| s2.count(x)<=s1.count(x)}
end