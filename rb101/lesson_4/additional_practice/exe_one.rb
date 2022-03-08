flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hsh = flintstones.each_with_object({}) do |value, hsh|
  hsh[value] = flintstones.index(value)
end

puts flintstones_hsh