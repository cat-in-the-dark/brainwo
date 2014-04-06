class TeamDecorator < Draper::Decorator
  delegate_all

  def victim_name
    if object.victim
      object.victim.name
    else
      ''
    end
  end

  def pain_count(question)
    if object.victim && question 
      suffer = Suffering.find_by(participant: object.victim, question: question)
      return suffer.pain_count unless suffer.nil?
    end
    0
  end

  def all_pain_count
    object.participants.includes(:sufferings).references(:sufferings).sum('sufferings.pain_count')
  end

  def is_right_for?(question)
    return false if question.nil?
    
    answer = object.answers.find_by(question: question)
    return true if answer && answer.is_right?
    false
  end
end
