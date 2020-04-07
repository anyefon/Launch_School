print "what is the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
percentage = gets.chomp.to_f

tip = ((percentage * 0.01) * bill)
puts "The tip is #{format("$%0.2f", tip)}"

total = bill + tip
puts "The total is #{format("$%0.2f", total)}"