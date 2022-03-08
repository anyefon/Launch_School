def array_diff(a, b)
  
  a.select { |obj| b.include?(obj) == false}
  
end

def array_diff(a, b)
  a.reject {|e| b.include? e}
end