WORDED_NUMBERS = Hash[0, 'zero', 1, 'one', 2, 'two', 3, 'three', 4, 'four', 5, 'five', 6, 'six',
                          7, 'seven', 8, 'eight', 9, 'nine', 10, 'ten', 11, 'eleven',
                          12, 'twelve', 13, 'thirteen', 14, 'fourteen', 15, 'fifteen', 
                          16, 'sixteen', 17, 'seventeen', 18, 'eighteen', 19, 'nineteen']

def alphabetic_number_sort(arr)
  worded_numbers = []
  sorted_numbers = []
  arr.each{|num| worded_numbers << WORDED_NUMBERS[num]}
  worded_numbers.sort.each{|word| sorted_numbers << WORDED_NUMBERS.key(word)}
  sorted_numbers
end
puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
] 

# def alphabetic_number_sort(arr)
#   english = %w(zero one two three four five six seven eight nine ten eleven
#     twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
#   arr.sort { |a, b| english[a] <=> english[b] }
# end
# interesting solution from a classmate.