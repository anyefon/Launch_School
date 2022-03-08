module Device
  def switch_on ; puts "on" end
  def switch_off ; puts "off" end
end

module Volume
  def volume_up ; puts "volume up" end
  def volume_down ; puts "volume down" end
end

module Pluggable
  def plug_in ; puts "plug in" end
  def plug_out ; puts "plug out" end
end

class CellPhone
  include Device, Volume, Pluggable

  def ring
    puts "ringing"
  end
end

cph = CellPhone.new
cph.switch_on
cph.volume_up
cph.ring