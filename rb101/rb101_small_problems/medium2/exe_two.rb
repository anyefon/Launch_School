BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(str)
  str.upcase!
  BLOCKS.all? do |block|
    !(str.include?(block[0]) && str.include?(block[-1]))
  end
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true