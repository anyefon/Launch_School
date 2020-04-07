operator = Hash['s', 'sum', 'p', 'product']

def prompt(message)
  puts "=> " + message
end

def valid_num?(num)
  !!(/\d/.match(num) && num.to_i > 0)
end

def get_number
  prompt "Please enter an integer greater than 0 "
  num = nil
  loop do
    num = gets.chomp
    break unless !(valid_num?(num))
    prompt "Your number is invalid. Choose an integer greater 0"
  end
  num
end

def choose_operation
  prompt "Enter 's' to compute the sum and 'p' to compute the product" 
  operation = ''
  loop do
    operation = gets.chomp
    break if %w(s p).include?(operation)
    prompt "Choose a valid operation"
  end
  operation
end

def compute_sum (number)
  (1..number.to_i).inject(:+)
end

def compute_product(number)
  (1..number.to_i).inject(:*)
end

number = get_number
operation = choose_operation
result = operation == 's' ? compute_sum(number) : compute_product(number) 
prompt "The #{operator[operation]} of the integers between 1 and #{number} is #{result}"
