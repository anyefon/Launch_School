def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join('')

  puts 'HEY ' + name
end

# def shout_out_to(name)
#   puts 'HEY ' + name.upcase
# end

shout_out_to('you') # expected: 'HEY YOU'