class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
After line `2`, the local variable `name` and instance variable `@name` both reference 
the integer 42 in memory.
`@name = name.to_s` makes `@name` now reference a string object `"42"`
Line `3` reassigns `name` to a different integer `43`.

=end