arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

selected_arr = arr.select do |hsh|
  hsh.all? do |key, value|
    value.all?{|num| num.even?}
  end
end

p selected_arr