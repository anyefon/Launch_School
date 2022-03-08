def buy_fruit(array)
  fruits = []

  array.each do |sub_arr|
    fruit, number = sub_arr
    fruits << [fruit] * number
  end

  fruits.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]