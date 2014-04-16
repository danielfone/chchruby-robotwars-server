class Leaderboard
  def initialize(window, robots)
    @font_size = 24
    @robots = robots
    @font = Gosu::Font.new(window, 'Courier New', @font_size)
    @x_offset = @font_size
    @y_offset = @font_size * 2
  end

  def draw
    if @robots
      @robots.sort_by { |r| -1*r.first.score }.each_with_index do |r, i|
        y = @y_offset + i * @font_size
        color = r.last.font_color
        color &= 0x55ffffff if r.first.dead
        @font.draw("#{r.first.name}", @x_offset, y, ZOrder::UI, 1.0, 1.0, color)
        @font.draw('%.1f' % r.first.score, @x_offset + (@font_size * 6), y, ZOrder::UI, 1.0, 1.0, color)
      end
    end
  end
end