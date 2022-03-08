=begin
Your goal is to write the group_and_count method, which should receive and 
array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. 
This hash returned must contain as keys the unique values of the array, and as values 
the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

input:
-array
output:
- a hash with integers as keys and the instances of integer in array as values

rules:
-Empty or nil input must return nil instead of a hash

algo:
-create hash hsh
-if input array is empty? or input is nil, return nil
-for each value in input array
  - hsh[value] += 1
return hsh
=end

def group_and_count(input)
  #TODO
  hsh = Hash.new(0)
  return nil if input.empty? || input == nil

  input.each do |value|
    hsh[value] += 1
  end
  hsh
end

p group_and_count([0,1,1,0])
