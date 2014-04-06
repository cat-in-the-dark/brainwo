module Owner::TeamsHelper
  def team_rating_klass(team)
    'danger' if team.killed?
  end
end
