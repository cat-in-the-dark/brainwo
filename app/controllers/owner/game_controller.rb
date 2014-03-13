class Owner::GameController < OwnerController
  before_action :build_game

  def start
    @game.start
    
    redirect_to [:owner, game_path(quiz_id: @game.quiz.id)]
  end

  def close
    @game.close

    redirect_to [:owner, @quiz]
  end

  def show
    @question = game.current_question
  end

  def set_question
    @question = game.questions.find params[:question_id]
    game.set_question @question
  end

  private
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
