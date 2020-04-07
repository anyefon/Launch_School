 def multiply(num1, num2)
   [num1, num2].inject(:*)
 end

# def square(num)
#   multiply(num, num)
# end


# puts square(5) == 25
# puts square(-8) == 64

def power_to_n(num, power)
  power = power.abs
  numbers = [num] * power
  product = 1
  numbers.each do |number|
    product = multiply(number, product)
  end
  product
end

puts power_to_n(12, 3)
puts power_to_n(-5, 3)