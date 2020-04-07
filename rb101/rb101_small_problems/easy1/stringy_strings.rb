def stringy(number, start = 1)
  bits = ""
  bit1, bit2 =  start == 1 ? ['1', '0'] : ['0', '1']
  number.times do |n|
    n.odd? ? bits<< bit2 : bits << bit1
  end
  bits
end

puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '0101010'
