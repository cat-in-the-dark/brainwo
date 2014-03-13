class OwnerController < ApplicationController
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