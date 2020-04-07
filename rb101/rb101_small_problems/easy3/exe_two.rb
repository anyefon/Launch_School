list = %w(first second)
numbers = []
operators = %i(+ - * / % **)

def prompt(message)
  puts "==>" + message
end

1.upto(list.size) do |i|
  prompt " Enter the #{list[i-1]} number"
  numbers << gets.chomp.to_i 
end

operators.each do |op|
  prompt " #{numbers[0]} #{op.to_s} #{numbers[1]} = #{numbers.inject(op)}"
end