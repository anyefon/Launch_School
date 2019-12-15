puts "Input a number between 0 and 100"

num = gets.chomp.to_i
puts num

if number < 0
  puts "You can't enter a negative number!"
elsif number <= 50
  puts "Number is between 0 and 50"
elsif number <= 100
  puts "Number is between 51 and 100"
else
  puts "Number is above 100"
end