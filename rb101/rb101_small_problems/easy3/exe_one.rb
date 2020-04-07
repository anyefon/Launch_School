ordinals = %w(st nd rd th th)
numbers = []

def prompt(message)
  puts "==>" + message
end

1.upto(ordinals.size) do |i| 
  prompt "Enter the #{i}#{ordinals[i-1]} number:"
  numbers << gets.chomp.to_i
end

prompt "Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include?(last_number) 
  puts "The number #{last_number} appears in #{numbers}"
else
  puts "The number #{last_number} does not appear in #{numbers}"
end
