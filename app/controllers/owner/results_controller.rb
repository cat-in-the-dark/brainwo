class Owner::ResultsController < OwnerController
  before_action :build_game

  def rating
    @quiz = @game.quiz
    @questions = @game.questions
    @teams = @quiz.teams.with_rating.decorate
  end

  def overall
  end

  def punishment
  end

  private
  
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
