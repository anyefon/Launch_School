# def staggered_case(str)
#   switch = true
#   staggered_str = ''

#   str.each_char do |char|
#     if char =~ /[a-zA-Z]/
#       switch ? staggered_str << char.upcase : staggered_str << char.downcase
#       switch = !switch
#     else
#       staggered_str << char
#       switch = !switch
#     end
#   end

#   staggered_str
# end

def staggered_case(str, count_non_alphas)
  switch = true
  staggered_str = ''

  str.each_char do |char|
    if char =~ /[a-zA-Z]/
      switch ? staggered_str << char.upcase : staggered_str << char.downcase
      switch = !switch
    else
      staggered_str << char
      switch = !switch if count_non_alphas
    end
  end

  staggered_str
end



# str.each_char do |char|
#   if switch == true
#     if char =~ /[a-zA-Z]/
#       staggered_str << char.upcase
#     else
#       staggered_str << char
#     end
#     switch = !switch
#   else
#     if char =~ /[a-zA-Z]/
#       staggered_str << char.downcase
#     else
#       staggered_str << char
#     end
#     switch = !switch
#   end
# end
puts staggered_case('ALL_CAPS', true) == 'AlL_CaPs'
puts staggered_case('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'