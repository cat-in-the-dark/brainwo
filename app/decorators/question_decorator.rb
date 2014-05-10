class QuestionDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def is_right_for?(team)    
    answer = object.team_answers.find_by(team: team)
    return true if answer && answer.is_right?
    false
  end
end
