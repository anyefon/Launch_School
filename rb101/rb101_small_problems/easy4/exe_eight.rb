
def string_to_integer(str)
  bytes_arr = str.bytes
  value = 0
  bytes_arr.each {|num| value = value * 10 + (num - 48)}
  value
end

# def string_to_signed_integer(str)
#   if str.include?('-')
#     str.delete!('-')
#     0 - string_to_integer(str)
#   elsif str.include?('+')
#     str.delete!('+')
#     string_to_integer(str)
#   else
#     string_to_integer(str)
#   end
# end

def string_to_signed_integer(string)
  if string.start_with?('-', '+')
    string.start_with?('-') ? 0 - string_to_integer(string[1..-1]) : string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end


puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
