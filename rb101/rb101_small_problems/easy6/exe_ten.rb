def triangle(num)
  num.times do |i|
    blanks = ' ' * (num - (i + 1))
    stars = '*' * (i + 1)
    puts "#{blanks} #{stars}"
  end
end

triangle(5)
triangle(9)