def multisum(num)
  multiples = []
  1.upto(num) do |i|
    if (i % 3 == 0) || (i % 5 == 0)
      multiples << i unless multiples.include?(i)
    end
  end
  multiples.inject(:+) 
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168