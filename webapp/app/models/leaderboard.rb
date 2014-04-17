class Leaderboard

  def teams
    Team.order(:total)
  end

  def matches
    Match.all
  end

end
