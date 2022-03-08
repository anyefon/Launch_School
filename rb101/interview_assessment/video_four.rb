# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you you find a 
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# find substring that appears in both strings. Only substrings longer than a letter are of interest here.
# return true if there is a substring and false if there isn't
# if any input string is an empty string, return false
# the comparison should be case insensitive

# algorithm
# check if any argument is an empty string and return false if that is the case
# create substrings from one of the input strings, preferably the shortest
# check if any substring longer than one character is present in the other given string
# if present return true, if not return false

# def create_substrings(string)
#   substrings = []

#   (0...string.size).each do |startidx|
#     (startidx...string.size).each do |endidx|
#       substrings << string[startidx..endidx] if string[startidx..endidx].size > 1
#     end
#   end

#   substrings
# end

# def substring_test(string1, string2)
#   # return false if string1 == "" || string2 == ""
#   substrings = create_substrings(string2)
#   substrings.any?{|substring| string1.downcase.include?(substring.downcase)}
# end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', '111t') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

#*******************************************************************************************
# Write function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2. Otherwise return false.

# For example:
# str1 is "rkqodlw" and str2 is "world" the output should return true.
# str1 is "cedewaraaossoqqyt" and str2 is "codewars" should return true.
# str1 is "katas" and str2 is "steak" should return false.

# Only lower case letters will be used  (a-z). No punctuation or digits will be included.
# Rules
# duplicates should be counted

# Algorithm
# create two hashes with each character as key and number of occurences as value for both strings
# check if for each key in hsh2, the value corresponds to the value in hsh1 for the same key
#  return true if that is the case or false if it isn't

# def create_hash(string)
#   hsh = {}
#   string.each_char do |chr|
#     hsh[chr] = string.count(chr) if !(hsh[chr])
#   end
#   hsh
# end

# def scramble(str1, str2)
#   hsh1 = create_hash(str1)
#   hsh2 = create_hash(str2)
  
#   hsh2.all? do |key, value|
#     return false if hsh1[key] == nil
#     hsh1[key] >= value 
#   end

# end

def scramble(str1, str2)
  str2.chars.each do |char|
    return false if str2.count(char) > str1.count(char)
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true