class QuestionsController < ApplicationController

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
      redirect_to @question
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
      redirect_to @question
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :answer)
  end
end
