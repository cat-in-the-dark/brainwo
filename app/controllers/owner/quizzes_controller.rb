class Owner::QuizzesController < OwnerController
  def index
    @quizzes = quizzes
  end

  def show
    @quiz = quizzes.find params[:id]
    @questions = @quiz.questions
  end

  def new
    @quiz = quizzes.build
  end

  def create
    @quiz = quizzes.build quiz_params

    if @quiz.save
      redirect_to [:owner, @quiz]
    else
      render [:owner, :new]
    end
  end

  def edit
    @quiz = quizzes.find params[:id]
  end

  def update
    @quiz = quizzes.find params[:id]

    if @quiz.update_attributes quiz_params
      flash[:success] = "Quiz #{@quiz.name} updated"
      redirect_to [:owner, @quiz]
    else
      render [:owner, :edit]
    end
  end

  def destroy
    @quiz = quizzes.find params[:id]
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
