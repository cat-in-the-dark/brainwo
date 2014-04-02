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
    answer = team.answers.find_by(question: current_question)
    
    if answer && !answer.is_right
      true
    else
      false
    end
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

  def wait_for_violence?
    current_question && current_question.wait_checking?
  end
end