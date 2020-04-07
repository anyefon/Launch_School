# def repeat(str, num)
#   num.times{ |i| puts str}
# end

# repeat('hello', 5)

def repeat(str, num)
  while num > 0
    puts str
    num--
  end
end

repeat('hello', 5)