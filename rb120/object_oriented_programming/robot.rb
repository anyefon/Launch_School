class Robot
  def initialize(name)
    @name = name
  end

  def talk
    puts "I'm a robot, and I can talk."
  end
end

r2d2 = Robot.new("R2D2")
c3p0 = Robot.new("C3P0")

puts r2d2.object_id
puts c3p0.object_id