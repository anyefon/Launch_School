a = [1,3,4]

# Example of a method definition that modifies its argument permanently

def mutate(array)
  array.pop
end

# Example of a method definition that does not mutate the caller
=begin
def mutate(array)
  array.last
end  
=end
p "Before mutate function: #{a}"
p mutate(a)

p "After mutate function: #{a}"
