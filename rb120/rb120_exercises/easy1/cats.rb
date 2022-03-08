class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

#Furthermore
=begin
An alternative approach to this problem would be to modify the Pet class to accept a colors parameter.
If we did this, we wouldn't need to supply an initialize method for Cat.

Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not?
How might you deal with some of the problems, if any, that might arise from modifying Pet?

Question 1. Why would we be able to omit the initialize method?
Due to Inheritance. As `Cat` inherits from `Pet`, all public instance methods and variables from the superclass are now available to the 
subclass.

Question 2. Would it be a good idea to modify Pet in this way? Why or why not?
No. The idea behind inheritance is to first have a generic class then proceed to a more specialized class. Modifying the superclass
defeats that purpose.

Question 3. How might you deal with some of the problems, if any, that might arise from modifying Pet?
Modifying `Pet` would make `Cat` redundant. So a solution might be to move `to_s` instance method to `Pet` and delete `Cat`.

SEE ANSWERS

=end