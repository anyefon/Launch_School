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

puts staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS', false) == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end