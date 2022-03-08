flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! {|name| name[0..2]}

flintstones.each do |name|
  name.slice!(3..-1)
end

p flintstones