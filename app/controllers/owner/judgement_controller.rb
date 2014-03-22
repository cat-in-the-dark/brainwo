class Owner::JudgementController < OwnerController
  before_action :build_game

  def index
    @teams = @game.teams
  end

  def show
    @team = @game.teams.find_by(id: params[:tema_id])
  end

  def hurt
    @team = @game.teams.find_by(id: params[:tema_id])
    #TODO call hurting service
    render json: {status: :accepted, pain: 0 }
  end

  def toggle_status
    @team = @game.teams.find_by(id: params[:team_id])
    #TODO call hurnig service and kill team or make alive
    render json: { status: :updated, life_status: @team.status }
  end

  private

  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
