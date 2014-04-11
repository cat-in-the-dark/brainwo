class GameService
  STATUSES = ['moderating', 'started', 'closed']
  attr_reader :quiz

  def initialize(quiz)
    @quiz = quiz
  end

  def questions
    quiz.questions
  end

  def teams
    quiz.teams
  end

  def team_fail?(team)
    answer = team.answers.find_by(question: current_question) if current_question
    
    if answer && !answer.is_right
      true
    else
      false
    end
  end

  def need_punishment?
    if current_question
      Rails.logger.info "PUNISHMENT: #{current_question.pain_count}"
      current_question.reload.pain_count > 0
    else
      false
    end
  end

  def start_punishment
    current_question.start_punishment unless current_question.nil?
  end

  def stop_punishment
    close_current_question
  end

  def current_question
    quiz.current_question
  end

  def current_question?(question)
    quiz.current_question == question
  end

  def close_current_question
    quiz.current_question.make_used
    quiz.current_question = nil
    quiz.save
  end

  def set_question(question_id)
    question = quiz.questions.find question_id

    if started?
      quiz.current_question = question
      return quiz.save
    end
    false
  rescue
    false
  end

  def start
    quiz.update_attribute :status, 'started'
  end

  def close
    quiz.update_attribute :status, 'closed'
    quiz.update_attribute :current_question_id, nil
  end

  def started?
    quiz.status == 'started'
  end

  def closed?
    quiz.status == 'closed'
  end

  def in_punishment_mode?
    current_question && current_question.punishment?
  end

  def state
    return 'closed' if closed?
    return 'waiting' if current_question.nil?
    return 'punishment' if in_punishment_mode?
    'playing'
  end
end