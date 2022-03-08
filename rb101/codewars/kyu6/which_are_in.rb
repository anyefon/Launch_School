=begin
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of 
the strings of a1 which are substrings of strings of a2.

Example 1:
a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

Example 2:
a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.

input:
-two arrays of strings
output:
-return an array of sorted strings in alphabetical order from the array a1 which are substrings of the array a2
rules:
- no duplicates in the return array
- assume the input will always be valid string arrays
- lexicographical order = alphabetical order

algorithm:
- create an array of substrings
-for each element in a2,
  -for each element in a1,
    -if elt of a1 matches substring of elt in a2 ?
      append substring to substrings array if array doesn't already have substring yet
- return sorted array
=end

def in_array(array1, array2)
  substrings = []

  array2.each do |arr2|
    array1.each do |arr1|
      if arr2.match(arr1)
        substrings << arr1 if !(substrings.include?(arr1))
      end
    end
  end

  substrings.sort
end

=begin
def in_array(array1, array2)
  return array1.select{|s| array2.any?{|w| w.include?(s)}}.sort
end
=end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2)

a1 = ["tarp", "mice", "bull"]

p in_array(a1, a2)