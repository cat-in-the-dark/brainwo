class Owner::QuizzesController < OwnerController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find params[:id]
    @questions = @quiz.questions
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
    @quiz = owner.quizzes.build
  end

  def create
    @quiz = owner.quizzes.build quiz_params

    if @quiz.save
      redirect_to [:owner, @quiz]
    else
      render [:owner, :new]
    end
  end

  def edit
    @quiz = Quiz.find params[:id]
  end

  def update
    @quiz = Quiz.find params[:id]

    if @quiz.update_attributes quiz_params
      flash[:success] = "Quiz #{@quiz.name} updated"
      redirect_to [:owner, @quiz]
    else
      render [:owner, :edit]
    end
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

  def destroy
    @quiz = Quiz.find params[:id]
    if @quiz.destroy
      respond_with(@quiz, status: :destroyed) do |format|
        format.html do
          flash[:success] = "Quiz#{@quiz.name} destoroyed"
          redirect_to owner_quizzes_path
        end
      end
    else
      respond_with(@quiz, status: :unprocessable_entity) do |format|
        format.html { render :edit }
      end
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
