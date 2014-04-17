# follows and shoots
require 'rrobots'

class Seeker
  include Robot

  attr_accessor

  def initialize *args, &block
    @rt = @radar_scan = 10
    @min_radar_scan = 10.0
    @max_radar_scan = 30.0
    @radar_turned = false
    @min_distance = 0
    @direction = 1
    super
  end

  def tick events
    @direction = @min_distance - 175
    accelerate(@direction)
    wturn = 180 - ((radar_heading-heading)%360) + @rt*0.5
    wturn = [-10,[10,wturn].min].max
    turn wturn
    scan events
    turn_radar @rt - wturn
    fire @direction > 0 ? 0.5 : 3.0
  end

  def scan events
    if events['robot_scanned'].empty?
      increase_radar_scan
    else
      decrease_radar_scan
      @min_distance = events['robot_scanned'].min.first
    end
    @rt = if @radar_turned
      -@radar_scan
    else
      @radar_scan
    end if @radar_scan.abs < @max_radar_scan - 0.1
    @radar_turned = !@radar_turned
    @rt
  end

  def increase_radar_scan
    @radar_scan *= 1.5
    @radar_scan = [@radar_scan, @max_radar_scan].min
  end

  def decrease_radar_scan
    @radar_scan *= 0.5
    @radar_scan = [@radar_scan, @min_radar_scan].max
  end

end