=begin
merge and merge! both return a combined hash of the two hashs in question. However 
merge! modifies its caller destructively while merge doesn't
=end

siblings = {
  brother: "Rob",
  sister: "Jane"
}
in_laws = {
  mother: "Margaret",
  father: "Noah"
}
puts siblings.merge(in_laws)
p siblings
p in_laws

p siblings.merge!(in_laws)
p siblings
p in_laws