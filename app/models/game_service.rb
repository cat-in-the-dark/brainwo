class GameService
  STATUSES = ['moderating', 'started', 'closed']
  attr_reader :quiz

  def initialize(quiz)
    @quiz = quiz
  end

  def current_question
    quiz.current_question
  end

  def set_question(question)
    return nil unless question.quiz.eql? quiz

    if started?
      quiz.current_question = question
      quiz.save
    end
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