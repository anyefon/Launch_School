
incremented_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  incremented_hsh = {}
  hash.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end

p incremented_arr

