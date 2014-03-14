class OwnerController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_owner!
  layout 'owner/layouts/application'

  private

  def quizzes
    current_owner.quizzes
  end

  def questions
    current_owner.questions
  end
end