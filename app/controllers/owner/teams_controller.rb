class Owner::TeamsController < OwnerController
  before_action :find_quiz

  def index
    @teams = @quiz.teams
  end

  def new
    @team = @quiz.teams.build
  end

  def create
    @team = @quiz.teams.build team_params

    if @team.save
      flash[:success] = "Team #{@team.name} created"
      redirect_to [:owner, @quiz, :teams]
    else
      render :new
    end
  end

  def edit
    @team = @quiz.teams.find params[:id]
  end

  def update
    @team = @quiz.teams.find params[:id]
  
    if @team.update_attributes team_params
      flash[:success] = "Teams #{@team.name} updated"
      redirect_to [:owner, @quiz, :teams]
    else
      render :edit
    end
  end

  def destroy
    @team = @quiz.teams.find params[:id]

    if @team.delete
      flash[:success] = "Team #{@team.name} was deleted"
      redirect_to [:owner, @quiz, :teams]
    else
      flash[:danger] = "Can't delete team #{@team.name}"
      redirect_to [:owner, @quiz, :teams]
    end
  end

  private

  def find_quiz
    @quiz = Quiz.find params[:quiz_id]
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
