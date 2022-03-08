# def print_quadrant(num)
#   spaces, stars = [], []
#   half = (num / 2)
#   1.upto(half + 1){|i| stars << i}
#   half.downto(0){|i| spaces << i}
#   spaces.each_with_index do |space, index|
#     puts "#{' ' * space}#{'*' * stars[index]}"
#   end

# end


# def diamond(grid_size)
#   spaces, stars = [], [] # initializing spaces and stars array
#   max_spaces = grid_size / 2

#   max_spaces.downto(0){|i| spaces << i} # populate the spaces array e:g [2, 1, 0] for grid_size = 5
#   1.upto(grid_size){|i| stars << i if i % 2 == 1}
#   # populate the stars array with odd numbers from 1 to grid_size e:g [1, 3, 5] for grid_size = 5
#   spaces = spaces + spaces[0..-2].reverse # spaces for lower half of diamond e.g [2, 1, 0, 1, 2]
#   stars = stars + stars[0..-2].reverse # stars for lower half of diamond e:g [1, 3, 5, 3, 1]
#   spaces.each_with_index do |space, index|
#     puts "#{' ' * space}#{'*' * stars[index]}"
#   end # printing spaces and stars simultaneously
# end

# diamond(5)

def print_stars(num)
  stars = '*' * num
  1.upto(num - 2){|i| stars[i] = ' '} if num > 1

  stars
end


def diamond(num)
  spaces, stars = [], []
  max_spaces = num / 2

  max_spaces.downto(0){|i| spaces << i}
  1.upto(num){|i| stars << i if i % 2 == 1}
  spaces = spaces + spaces[0..-2].reverse
  stars = stars + stars[0..-2].reverse
  
  spaces.each_with_index do |space, index|
    puts "#{' ' * space}#{print_stars(stars[index])}"
  end
end

diamond(5)