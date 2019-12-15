#case statement equivalent of exercise three
def ranger(number)
  case 
  when number < 0
    puts "Less than zero"
  when number <= 50
    puts "Number between 0 and 50"
  when number <= 100
    puts "Number between 50 and 100"
  else 
    puts "Number is greater than 100"
  end
end
puts "Enter a number"
num = gets.chomp.to_i
ranger(num)
#the else statement in case can take an if else statement


