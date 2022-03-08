=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

input:
-string in camel case
output:
-string in kebab case
rules:
-remove numbers from the returned string
algorithm:
-create a string variable
-substitute all numbers in string with an empty str
-for each char in string
  -if char is upcase
    - reassign char to "-" +char.downcase
  -arr << char
=end

def kebabize(str)
  string = ""
  str.gsub(/[^a-zA-Z]/, "").each_char do |char|
    if (A..Z).include?(char)
      char = "-" + char.downcase
    end
    string << char
  end
  string
end