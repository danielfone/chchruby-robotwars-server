require 'rrobots'

class Duck
  include Robot

  def tick(events)
    locate_target unless target

    if target_locked?
      fire 3
      locate_target
    elsif target
      turn_gun_to target
    end

    turn_radar 10
  end

  def locate_target
    @target = events['robot_scanned'].any? ? radar_heading : false
  end

  def turn_gun_to(target_heading)
    turn_gun bearing_betwen(gun_heading, target_heading)
  end

  def target_locked?
    gun_heading == target
  end

  def target
    @target
  end

private

  def bearing_betwen(initial, final)
    initial = 0 if initial == 360
    final   = 0 if final == 360
    clockwise = final - initial
    counterclockwise = 360 - final + initial
    clockwise.abs <= counterclockwise.abs ? clockwise : counterclockwise
  end

end
