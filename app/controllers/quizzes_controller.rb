class QuizzesController < ApplicationController
  skip_before_action :check_sticking, only: [:show] do |controller|
    params[:id] == current_game.quiz.id
  end

  def index
    @quizzes = Quiz.started.all
  end

  def show
    @game = GameService.new(Quiz.find(params[:id]))
    @question = @game.current_question

    stick_to_quiz @quiz
  end
end
