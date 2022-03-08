=begin
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and 
numeric digits that occur more than once in the input string. The input string can be assumed to 
contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

input:
-a string
output:
-count of duplicates in string
rules:
-only alphabets(uppercase and lowercase) and numeric digits.
algorithm:
-create a hash
-for each char in string
  -calculate count in string and append value to hash(key as char and count as value)
   if hash doesn't already have entry
  -select key-value pairs that have a value greater than 1
  - count the number of keys
=end

def duplicate_count(text)
  #your code here
  hsh = {}

  text.each_char do |chr|
    hsh[chr.downcase] = text.downcase.count(chr.downcase) if !(hsh[chr.downcase])
  end
  hsh.select{|key, value| value > 1}.keys.count
end

# def duplicate_count(text)
#   ('a'..'z').count { |c| text.downcase.count(c) > 1 }
# end