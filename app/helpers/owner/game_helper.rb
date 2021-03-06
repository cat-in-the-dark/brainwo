module Owner::GameHelper
  def question_toggle(game, question)
    if game.current_question?(question)
      if game.current_question.punishment?
        link_to 'Stop punishment', owner_game_stop_punishment_path({quiz_id: game.quiz.id}), class: 'btn btn-warning', method: :put
      else
        link_to 'Rate', owner_game_rate_path({quiz_id: game.quiz.id}), class: 'btn btn-info'
      end
    else
      link_to 'Start', owner_set_game_question_path({quiz_id: game.quiz.id, question_id: question.id}), class: 'btn btn-success', method: :put
    end
  end

  def question_klass(game, question)
    return 'warning' if question.punishment? 
    return 'success' if game.current_question?(question)
    return 'info' if question.used?
  end
end
