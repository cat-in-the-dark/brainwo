class Owner::ResultsController < OwnerController
  before_action :build_game
  respond_to :html, :json

  def rating
    @quiz = @game.quiz
    @questions = @game.questions.with_answers.decorate
    @teams = @quiz.teams.with_answers_count.decorate
  end

  def overall
    @participants = @game.participants.unscoped.with_pain_count.decorate
  end

  def punishment
    @pain_service_collection = @game.teams.map do |team|
      next unless @game.team_fail?(team)
      PainService.new(team, @game)
    end.compact

    respond_with do |format|
      format.json do
        render json: @pain_service_collection
      end
    end
  end

  private
  
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
