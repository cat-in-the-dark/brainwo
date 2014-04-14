module Owner::ResultsHelper
  def correcy_class(team, question)
    return '' if question.unused?
    team.is_right_for?(question) ? "success" : "danger"
  end

  def correcy_text(team, question)
    return 'O' if question.unused?
    team.is_right_for?(question) ? "V" : "X"
  end
end
