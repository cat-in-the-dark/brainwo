class AnswerService
  attr_reader :team, :question

  def initialize(team, question)
    @team = team
    @question = question
  end
end