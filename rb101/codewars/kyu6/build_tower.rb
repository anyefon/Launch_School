=begin
Build Tower
Build Tower by the following given argument:
number of floors (integer and always greater than 0).

for example, a tower of 3 floors looks like below

[
  '  *  ', 
  ' *** ', 
  '*****'
]
and a tower of 6 floors looks like below

[
  '     *     ', 
  '    ***    ', 
  '   *****   ', 
  '  *******  ', 
  ' ********* ', 
  '***********'
]

input:
-an integer for the number of floors
output:
-a tower with number of floors corresponding to number given in input
rules:
-each string in the array is made up of space(s), asterisk(s) and space(s)
-this arrangement can be modeled using the formula n - i -1 for the spaces where n is the given number
 and i is the index number
-the number of asterisks can be modeled using the formula 2i + 1
algorithm:
-create array called floors
-for number from 0 upto n - 1
  -multiply a space string by (n-i-1), asterisk string by (2i +  1) and space string by (n-i-1)
  -append the resulting string to floors array
-return floors array
=end

def towerBuilder(n_floors)
  floors = []
  0.upto(n_floors - 1) do |i|
    floors << " " * (n_floors - i - 1) + "*" * (2 * i - 1) + " " * (n_floors - i - 1)
  end
  return floors
end