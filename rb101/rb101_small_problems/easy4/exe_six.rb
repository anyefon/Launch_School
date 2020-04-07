# def running_total(arr)
#   totals_arr = []
#   sum = 0
#   loop do
#     break if arr.length == 0
#     totals_arr << sum = arr.shift + sum
#   end
#   totals_arr
# end

def running_total(arr)
  totals_arr = []
  acc = 0
  arr.each do |num|
    acc = acc + num
    totals_arr << acc
  end
  totals_arr
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []