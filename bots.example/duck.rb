require 'rrobots'

class Duck
  include Robot

  def tick events
    turn_radar 20
    accelerate 1
    turn rand(5).to_i

    turn_gun 5
    fire 0.1
  end

end

#class Bullet
#  def initialize bf, x, y, heading, speed, energy, origin
#    @x, @y, @heading, @origin = x, y, heading, origin
#    @speed, @energy = speed, energy
#    @battlefield, dead = bf, false
#    @energy = 1 if @origin.robot.is_a? Duck
#  end
#end
