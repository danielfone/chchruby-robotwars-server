class Leaderboard

  def teams
    Team.order('total DESC')
  end

  def matches
    Match.all
  end

end
