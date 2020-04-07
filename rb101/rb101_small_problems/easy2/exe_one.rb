def prompt(message)
  puts "=> " + message
end

def calculate_age(name)
  age = rand(20..200)
  prompt "#{name} is #{age} years old!"
end

prompt "Enter name: "
name = gets.chomp
name = "Teddy" if name == ''
calculate_age(name)
