=begin
Write a method that takes a string as an argument and groups the number of time each character 
appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

For example:

get_char_count("Mississippi") => {4=>["i", "s"], 2=>["p"], 1=>["m"]}
get_char_count("Hello. Hello? HELLO!!") => {6=>["l"], 3=>["e", "h", "o"]}
get_char_count("aaa...bb...c!") => {3=>["a"], 2=>["b"], 1=>["c"]}
get_char_count("aaabbbccc") => {3=>["a", "b", "c"]}
get_char_count("abc123") => {1=>["1", "2", "3", "a", "b", "c"]}

input:
-a string
output:
-a hash with the number of occurences of each char as key, and the corresponding chars in an array
rules:
-method should be case insentive
-non-alphanumeric characters should be ignored
algorithm:
-create a hash
-substitute all non-alphanumerics with an empty
-for each character in the range (a..z), 
  -check how many instances of that character appears in string
  -if count is already present as key in hash,
    -append character to value like this hash[count] << character
  -else
    -create new entry in hash hash[count] = [character]
-return hash
=end

def get_char_count string
  hsh = {}
  string = string.gsub(/[^a-zA-Z]/, '')

  (a..z).each do |char|
    count = string.downcase.count(char)
    if hsh[count]
      hsh[count] << char
    else
      hsh[count]  = [char]
    end
  end
  hsh
end