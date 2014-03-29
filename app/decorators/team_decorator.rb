class TeamDecorator < Draper::Decorator
  delegate_all

  def killed?
    object.status == 'killed'
  end

  def alive?
    object.status == 'alive'
  end

  def victim_name
    if object.victim
      object.victim.name
    else
      ''
    end
  end

  def is_right_for?(question)
    answer = object.answers.find_by(question: question)
    return true if answer && answer.is_right?
    false
  end
end
