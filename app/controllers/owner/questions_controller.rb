class Owner::QuestionsController < OwnerController
  respond_to :html, :json

  def index
    @questions = Question.all
    respond_with @questions
  end

  def show
    @question = Question.find params[:id]
    respond_with @question
  end

  def edit
    @question = Question.find params[:id]
    respond_with @question
  end

  def update
    @question = Question.find params[:id]

    if @question.update_attributes question_params
      redirect_to [:owner, @question]
    else
      render :edit
    end
  end

  def new
    @question = Question.new
    respond_with @question
  end

  def create
    @question = Question.new question_params

    if @question.save
      redirect_to [:owner, @question]
    else
      render :new
    end
  end

  def destroy
    @question = Question.find params[:id]
    if @question.destroy
      respond_with(@question, status: :destroyed) do |format|
        format.html do
          flash[:success] = "Question#{@question.title} destoroyed"
          redirect_to owner_questions_path
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
    params.require(:question).permit(:title, :description, :answer)
  end
end