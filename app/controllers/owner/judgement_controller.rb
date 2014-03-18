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
    response json: {status: :accepted, pain: 0 }
  end

  def kill
    @team = @game.teams.find_by(id: params[:tema_id])
    #TODO call hurnig service and kill team
    response json: { status: :updated }
  end
end
