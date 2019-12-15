def counter(number) 
  if number <= 0
    puts number
  else
    puts number
    counter(number - 1)
  end
end

 counter(5)
