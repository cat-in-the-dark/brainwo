module Owner::JudgementHelper
  def killer_button(team, game)
    if team.alive?
      link_to 'Kill', '#', class: 'btn btn-danger btn-block btn-lg', id: 'js-kill-action', data: {url: owner_quiz_judgement_toggle_status_url({team_id: team.id, quiz_id: game.quiz.id})}
    else
      link_to 'Reanimate', '#', class: 'btn btn-success btn-block btn-lg', id: 'js-kill-action', data: {url: owner_quiz_judgement_toggle_status_url({team_id: team.id, quiz_id: game.quiz.id})}      
    end
  end

  def team_class(ps)
    return 'list-group-item-info' unless ps.immortal?
    return 'list-group-item-danger' if ps.team.killed?
  end

  def status(pain_service)
    "disabled" if pain_service.immortal?
  end
end
