
GRADES = Hash['A', (90..100), 'B', (80..89), 'C', (70..79), 'D', (60..69), 'E', (0..59)]

def get_grade(num1, num2, num3)
  grade = ''
  average = (num1 + num2 + num3) / 3.0
  GRADES.each do |_, value|
    grade << GRADES.key(value) if value.include?(average)
  end

  grade
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"