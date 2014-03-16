class Owner::QuestionsController < OwnerController
  respond_to :html, :json

  def show
    @question = questions.find params[:id]
    respond_with @question
  end

  def edit
    @question = questions.find params[:id]
    respond_with @question
  end

  def update
    @question = questions.readonly(false).find params[:id]

    if @question.update_attributes question_params
      redirect_to [:owner, @question]
    else
      render :edit
    end
  end

  def new
    @quiz = quizzes.find params[:quiz_id]
    @question = @quiz.questions.build
    respond_with @question
  end

  def create
    @quiz = quizzes.find params[:quiz_id]
    @question = @quiz.questions.build question_params

    if @question.save
      redirect_to [:owner, @question]
    else
      render :new
    end
  end

  def destroy
    @question = questions.readonly(false).find params[:id]
    if @question.destroy
      respond_with(@question, status: :destroyed) do |format|
        format.html do
          flash[:success] = "Question#{@question.title} destoroyed"
          redirect_to owner_game_path({quiz_id: @question.quiz.id})
        end
      end
    else
      respond_with(@question, status: :unprocessable_entity) do |format|
        format.html { render :edit }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :foreword, :core, :answer)
  end
end
