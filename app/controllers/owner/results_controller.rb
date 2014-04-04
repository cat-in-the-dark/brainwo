class Owner::ResultsController < OwnerController
  before_action :build_game

  def rating
    @quiz = @game.quiz
    @questions = @game.questions
    @teams = @quiz.teams.with_rating.decorate.sort do |a,b|
      # WTF!! It works, but make sql sorting plz.
      b.answers.where(is_right: true).count <=> a.answers.where(is_right: true).count
    end
  end

  def overall
  end

  def punishment
    @teams = @game.teams.decorate
  end

  private
  
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
