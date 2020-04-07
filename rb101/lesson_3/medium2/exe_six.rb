def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# better code
def colo_valid(color)
  color == 'blue' || color == 'green'
end