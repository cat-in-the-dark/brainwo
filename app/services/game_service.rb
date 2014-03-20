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

  def current_question
    quiz.current_question
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
end