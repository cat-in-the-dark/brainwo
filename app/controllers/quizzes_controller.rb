class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.started.all
  end

  def show
    @quiz = Quiz.find params[:id]
    @question = @quiz.current_question
  end
end
