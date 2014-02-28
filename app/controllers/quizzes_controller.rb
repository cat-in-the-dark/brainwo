class QuizzesController < ApplicationController
  def index
    @quizzes = current_owner.quizzes
    @quiz = Quiz.new
  end

  def edit
    @quiz = Quiz.find_by(id: params[:id])

    redirect_to quizzes_path unless @quiz
  end

  def create
    @quiz = current_owner.quizzes.build quiz_params
    if @quiz.save
      flash[:success] = "Quiz #{@quiz.name} created!"
      redirect_to edit_quiz_path @quiz
    else
      flash[:error] = "Can't create quiz #{@quiz.name}."
      redirect_to quizzes_path
    end
  end

  def show
    @quiz = Quiz.find_by(id: params[:id])

    redirect_to quizzes_path unless @quiz
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name)
  end
end
