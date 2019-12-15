def take_block(number, &block)
  block.call(number)
end
 num = 42
take_block(num) do 
  puts "Block being called in the method! #{num}"
end