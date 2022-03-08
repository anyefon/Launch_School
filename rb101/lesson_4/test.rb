count = 0

loop do
  count += 1
  if count % 2 == 0
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  break if count == 5
end