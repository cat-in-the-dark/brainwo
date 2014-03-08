class Owner::QuizzesController < OwnerController
  def index
  end

  def show
    @quiz = Quiz.find params[:id]
  end

  def start
    @quiz = Quiz.find params[:id]
    @quiz.start!
    
    redirect_to questions_owner_quiz_path(@quiz)
  end

  def close
    @quiz = Quiz.find params[:id]
    @quiz.close!

    redirect_to owner_quiz_path @quiz
  end

  def game
    @quiz = Quiz.find params[:id]
    @question = @quiz.current_question
  end

  def new
  end

  def questions
    @quiz = Quiz.find params[:id]
    @questions = @quiz.questions
  end

  def set_question
    @quiz = Quiz.find params[:id]
    @question = Question.find params[:question_id]
    @quiz.set_next_question! @question
    redirect_to game_owner_quiz_path @quiz
  end
end
