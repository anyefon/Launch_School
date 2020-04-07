a = 1         # outer scope variable

loop do       # the block following the invocation of the `loop` method creates an inner scope
  a
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent infinite loop
end

puts a 