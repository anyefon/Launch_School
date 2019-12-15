students = {
  mary: 100,
  margaret: 84,
  therese: 83,
  ondoa: 60
}

students.each_key{|k| puts k}
students.each_value{|v| puts v}
students.each {|k, v| puts "#{k} scored #{v}"}
