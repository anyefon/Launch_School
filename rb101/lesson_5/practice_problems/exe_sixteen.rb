def generate_uuid
  characters = ('1'..'9').to_a + ('a'..'f').to_a

  uuid = ''
  sections = [8, 4, 4, 4, 12]

  sections.each do |section|
    section.times {|_| uuid << characters.sample }
    uuid << '-' unless section == sections.last
  end
  uuid
end

p generate_uuid