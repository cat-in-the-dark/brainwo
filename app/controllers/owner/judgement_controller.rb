class Owner::JudgementController < OwnerController
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

  def toggle_team_status
    @team = @game.teams.find_by(id: params[:team_id])
    #TODO call hurnig service and kill team or make alive
    render json: { status: :updated, life_status: @team.status }
  end
end
