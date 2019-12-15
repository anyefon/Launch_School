a = 5

def some_method
  puts a
end
some_method
puts a
=begin
Variable lookup in  ruby does not move from inner scopes to outer scopes as is the case
with JS.
=end
