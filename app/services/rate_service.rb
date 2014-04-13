class RateService
  attr_reader :game, :teams_answers_collection, :victims_collection

  def initialize(game, answers_params, victims_params, question_params)
    @game = game

    @teams_answers_collection = TeamsAnswersCollection.build(@game.teams, @game.current_question, answers_params)
    @victims_collection = TeamsVictimsCollection.new(@game.teams, victims_params)
    @question_params = question_params
  end

  def rate
    begin
      ActiveRecord::Base.transaction do
        teams_answers_collection.save!
        victims_collection.save!
        game.current_question.update_attributes! @question_params
      end
    rescue
      return false
    end

    true
  end
end