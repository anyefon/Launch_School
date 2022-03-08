# class Vehicule
#   @@number_of_objects = 0

#   attr_accessor :color
#   attr_reader :year
#   attr_reader :model
#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @current_speed = 0
#     @@number_of_objects += 1
#   end

#   def spray_paint(color)
#     self.color=(color) 
#     puts "Your new #{color} paint job looks great!"
#   end

#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end

#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end

#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def self.object_number
#     puts "The number of objects created so far #{@@number_of_objects}"
#   end

#   def age
#     puts "Your #{self.model} is #{calculate_age} year(s) old."
#   end

#   private

#   def calculate_age
#     Time.now.year - self.year
#   end

# end

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end


# class MyCar < Vehicule
#   TYRES = 4

#   def to_s
#     "My car is a #{color}, #{year}, #{model}! "
#   end
# end

# class MyTruck < Vehicule
#   TYRES = 10
#   include Towable

#   def to_s
#     "My car is a #{color}, #{year}, #{model}"
#   end
# end

# MyCar.gas_mileage(13, 351)
# lumina = MyCar.new(1997, 'Chevy lumina', 'white')
# pickup = MyTruck.new(2021, 'Toyota Hilux', 'red')
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed
# puts lumina.color
# lumina.color = "blue"
# puts lumina
# puts pickup
# # Vehicule.object_number
# # puts "---------------------"
# # puts MyCar.ancestors
# # puts "---------------------"
# # puts MyTruck.ancestors
# # puts "---------------------"
# # puts Vehicule.ancestors

# lumina.age
# pickup.age


class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def name=(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def better_grade_than?(obj)
    grade > obj.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('joe', 99)
bob = Student.new('bob', 78)
puts "Welldone!" if joe.better_grade_than?(bob) 
