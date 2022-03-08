# class Wedding
#   attr_reader :guests, :flowers, :songs

#   def prepare(preparers)
#     preparers.each do |preparer|
#       case preparer
#       when Chef
#         preparer.prepare_food(guests)
#       when Decorator
#         preparer.prepare_foods(flowers)
#       when Musician 
#         preparer.prepare_performance(songs)
#       end
#     end
#   end
# end

# class Chef
#   def prepare_food(guests)
#   end
# end

# class Decorator
#   def decorate_place(flowers)
#   end
# end

# class Musician
#   def prepare_performance(songs)
#   end
# end

class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny")
puts dog.greeting