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

  def question
    @question = @game.questions.find params[:question_id]
  end

  def set_question
    if @game.set_question params[:question_id]
      flash[:success] = "Question showed to participants: #{@game.current_question.title}"
      redirect_to owner_game_question_path({quiz_id: @game.quiz.id, question_id: @game.current_question.id})
    else
      flash[:danger] = 'Game not started!'
      redirect_to owner_game_path(quiz_id: @game.quiz.id)
    end
  end

  private
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
