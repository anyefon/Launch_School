def print_even_numbers
  puts [*1..99].select(&:even?)
end
print_even_numbers