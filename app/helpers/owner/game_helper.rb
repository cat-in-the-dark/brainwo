module Owner::GameHelper
  def question_toggle(game, question)
    if game.current_question?(question)
      link_to 'Rate', owner_game_rate_path({quiz_id: game.quiz.id}), class: 'btn btn-info'  
    else
      link_to 'Start', owner_set_game_question_path({quiz_id: game.quiz.id, question_id: question.id}), class: 'btn btn-success'
    end
  end

  def question_klass(game, question)
    return 'success' if game.current_question?(question)
    return 'info' if question.used?
    return 'warning' if question.punishment? 
  end
end
