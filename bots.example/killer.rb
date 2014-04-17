require 'rrobots'

class Killer
  include Robot

  def min_max value, m
    value-= 360 if value > 180
    value+= 360 if value < -180
    value = -m if value < -m
    value = m if value > m
    return value
  end

  def tick events
    @dist = 1000 if @dist.nil?
    @target_heading = 0 if @target_heading.nil?
    @predicted_heading = 0 if @predicted_heading.nil?
    @radar_range = 60 if @radar_range.nil?
    @direction = 1 if @direction.nil?

    if !events['robot_scanned'].empty?
      @dist = events['robot_scanned'].first.first
      @target_heading = radar_heading - @radar_range * 0.5
      @predicted_heading = @target_heading + 16.0 * (rand(3)-1)
      if (@dist * @radar_range.abs <= 500)
        sx = x + Math::cos(@target_heading / 180 * Math::PI) * @dist
        sy = y - Math::sin(@target_heading / 180 * Math::PI) * @dist
        if @last_scan && (time - @last_scan[2]) == 1
          px = sx + (sx - @last_scan[0]) * (@dist - 90) / 30
          py = sy + (sy - @last_scan[1]) * (@dist - 90) / 30
          @predicted_heading = Math.atan2(y - py, px - x) / Math::PI * 180 % 360
        end
        @last_scan = [sx, sy, time]
      end
      @radar_range = (@dist * @radar_range.abs > 250) ? -@radar_range * 0.5 : -@radar_range
    else
      @radar_range *= -2 if (@radar_range.abs < 60)
    end

    fire 3

    if ((x < 100) || (x > 1500) || (y < 100) || (y > 1500)) && (@escape.nil? || @escape.zero?)
      @escape = 30
      @direction *= -1
    end

    @escape -= 1 if @escape && (@escape > 0)
    accelerate(@direction)

    turn_body = min_max(@target_heading - heading + 90, 10)
    gun = min_max(@predicted_heading - gun_heading - turn_body, 30)
    radar = min_max(@radar_range - gun - turn_body, 60)

    turn(turn_body)
    turn_gun(gun)
    turn_radar(radar)
  end
end