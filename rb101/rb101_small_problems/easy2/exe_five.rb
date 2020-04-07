print "What is your name? "
name = gets.chomp!

if name.reverse.start_with?('!')
  name.chop!
  puts ("hello #{name}. why are we screaming?").upcase
else
  puts "Hello #{name.capitalize}."
end