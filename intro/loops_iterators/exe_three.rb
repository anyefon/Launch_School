x = ['apples', 'mangoes', 'watermelon', 'berries', 'oranges']

x.each_with_index do |fruit, index| 
  puts " #{index + 1}, #{fruit}"
end
