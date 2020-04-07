# def string_to_integer(str)
#   bytes_arr = str.bytes
#   value = 0
#   bytes_arr.each {|num| value = value * 10 + (num - 48)}
#   value
# end
STR_INT_HSH = Hash['0', 0, '1', 1, '2', 2, '3', 3, '4', 4, '5', 5, '6', 6, '7', 7, '8', 8, '9', 9]

def string_to_integer(str)
  str.chars.map{|char| STR_INT_HSH[char]}.reduce(0){|acc, num| acc * 10 + num}
end


puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570