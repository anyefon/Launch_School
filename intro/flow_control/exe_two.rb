#method  returns all caps string if longer than ten
def print_string(words)
  if words.length > 10
    return words.upcase!  
  else
    return "String shorter than ten"
  end
end

puts print_string("hello world")  
puts print_string("two")
