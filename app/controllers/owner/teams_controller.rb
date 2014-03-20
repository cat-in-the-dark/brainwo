class Owner::TeamsController < OwnerController
  def index
    @teams = quiz.temas
  end

  def new
    @team = quiz.teams.build
  end

  def create
  end

  def edit
    @team = quiz.teams.find params[:id]
  end

  def update
  end
end
