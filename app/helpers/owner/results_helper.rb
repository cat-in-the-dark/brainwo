module Owner::ResultsHelper
  def correcy_class(team, question)
    return '' if question.unused?
    question.is_right_for?(team) ? "success" : "danger"
  end

  def correcy_text(team, question)
    return 'O' if question.unused?
    question.is_right_for?(team) ? "V" : "X"
  end
end
