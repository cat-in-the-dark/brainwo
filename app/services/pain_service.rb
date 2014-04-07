class PainService
  attr_reader :team, :game

  def as_json(options = {})
    data = {team: {id: team.id}, pain_count_percent: pain_count_percent, pain_count: pain_count, all_pain_count: all_pain_count}
    if options[:root]
      {pain_service: data}
    else
      data
    end
  end

  def initialize(team, game)
    @team = team
    @game = game
  end

  def kill_or_reanimate_team!
    if team.alive?
      team.kill
    else
      team.reanimate
    end
  end

  def hurt!(hurt_count)
    return false if hurt_count < 0
    return false if immortal?

    suffer = Suffering.find_or_create_by(participant: team.victim, question: game.current_question)

    if (suffer.pain_count + hurt_count >= all_pain_count)
      suffer.update_attribute(:pain_count, all_pain_count)  
    else
      suffer.update_attribute(:pain_count, suffer.pain_count + hurt_count)
    end
    true
  end

  def immortal?
    team.nil? || team.killed? || team.victim.nil? || !game.in_punishment_mode? || !game.team_fail?(team)
  end

  def pain_count
    if team.victim && game.current_question 
      suffer = Suffering.find_by(participant: team.victim, question: game.current_question)
      return suffer.pain_count unless suffer.nil?
    end
    0
  end

  def all_pain_count
    game.current_question.pain_count
  end

  def pain_count_percent
    pain_count.to_f * 100 / all_pain_count.to_f
  end
end