class Owner::JudgementController < OwnerController
  before_action :build_game

  def index
    @teams = @game.teams
  end

  def show
    @team = @game.teams.find_by(id: params[:team_id])
  end

  def hurt
    @team = @game.teams.find_by(id: params[:team_id])
    #TODO call hurting service
    all_pain = rand(100)
    pain = rand(all_pain)
    render json: { status: :accepted, pain: pain, all_pain: all_pain }
  end

  def toggle_status
    @team = @game.teams.find_by(id: params[:team_id])
    @team.toggle_status!
    #TODO call hurnig service and kill team or make alive
    render json: { status: :updated, life_status: @team.status }
  end

  private

  def build_game
    quiz = quizzes.with_teams.find params[:quiz_id]
    @game = GameService.new quiz
  end
end
