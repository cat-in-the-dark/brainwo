class ParticipantsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_game, :sticked
  before_action :check_sticking

  private

  def check_sticking
    redirect_to current_game.quiz if current_game
  end

  def current_game
    if session[:quiz_id] 
      @quiz = Quiz.started.find_by(id: session[:quiz_id])
      @current_game ||= GameService.new(@quiz) if @quiz
    end

    unstick if @current_game.nil?
    @current_game
  end

  def sticked?
    true if current_game
  end

  def stick_to_quiz(quiz)
    session[:quiz_id] = quiz.id if quiz
    logger.info "SESSION #{session.as_json}"
  end

  def unstick
    session[:quiz_id] = nil
  end
end
