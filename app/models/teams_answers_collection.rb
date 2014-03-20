class TeamsAnswersCollection
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_reader :teams, :answers, :question

  validate :is_answers_valid

  def initialize(teams, question, answers)
    @teams = teams
    @question = question
    @answers = answers
  end

  def persist?
    false
  end

  def self.build(teams, question, params = {})
    Rails.logger.info "ANSWERS: #{params.as_json}"
    answers = teams.map do |t| 
      answer = t.answers.find_or_initialize_by(question: question) 
      if params[t.id.to_s]
        answer.is_right = params[t.id.to_s]['is_right'] unless params[t.id.to_s]['is_right'].nil?
        answer.body = params[t.id.to_s]['body']
      end

      answer
    end

    TeamsAnswersCollection.new(teams, question, answers)
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end 

  private

  def persist!
    answers.each(&:save)
  end

  def is_answers_valid
    unless answers.all?(&:valid?)
      answers.each_with_index do |answer, index|
        answer.errors.full_messages.each do |msg|
          errors.add :base, "Line #{index}: #{msg}"
          Rails.logger.info "ERROR: #{answer.as_json}"
        end
      end
    end
  end
end