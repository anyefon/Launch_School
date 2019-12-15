students = {
  mary: 100,
  margaret: 84,
  therese: 83,
  ondoa: 60
}
puts "Enter value"
value = gets.chomp.to_i
if students.key(value)
  puts "hash contains value"
else
  puts "sorry, no value"
end
=begin
has_value? is a better option
=end