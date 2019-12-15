def has_a_b?(string)
  if mdata = /b/.match(string)
    puts "We have a match!"
  else 
    puts "No match here."
  end
  puts mdata
end
has_a_b?("basketball")
has_a_b?("footBall")
has_a_b?("hockey")
has_a_b?("golf")