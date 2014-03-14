class Owner::GameController < OwnerController
  before_action :build_game

  def start
    @game.start
    
    redirect_to owner_game_path(quiz_id: @game.quiz.id)
  end

  def close
    @game.close

    redirect_to owner_game_path(quiz_id: @game.quiz.id)
  end

  def show
  end

  def current_question
    @question = @game.current_question
  end

  def set_question
    @game.set_question params[:question_id]
    
    redirect_to owner_game_current_question_path(quiz_id: @game.quiz.id)
  end

  private
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
