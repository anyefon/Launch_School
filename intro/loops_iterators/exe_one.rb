x = [1,2,3,4,5]
x.each do |a|
  a + 1
end
## the each method will always return the original array it was called on
## while map will return the modified array