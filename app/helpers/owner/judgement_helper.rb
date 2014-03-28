module Owner::JudgementHelper
  def killer_button(team, game)
    if team.alive?
      link_to 'Kill', '#', class: 'btn btn-danger btn-block btn-lg', id: 'js-kill-action', data: {url: owner_quiz_judgement_toggle_status_url({team_id: team.id, quiz_id: game.quiz.id})}
    else
      link_to 'Reanimate', '#', class: 'btn btn-success btn-block btn-lg', id: 'js-kill-action', data: {url: owner_quiz_judgement_toggle_status_url({team_id: team.id, quiz_id: game.quiz.id})}      
    end
  end
end
