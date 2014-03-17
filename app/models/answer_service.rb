class AnswerService
  attr_reader :team, :question

  def initialize(team, question)
    @team = team
    @question = question
    @answer = TeamAnswer.find_or_initialize_by(team: @team, question: @question)
  end

  def correct?
    @answer.is_correct
  end

  def update_status(status, answer = nil)
    @answer.is_correct = status
    @answer.body = answer if answer
    @answer.save
  end
end