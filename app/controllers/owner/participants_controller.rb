class Owner::ParticipantsController < OwnerController
  before_action :find_team

  def create
    @participant = @team.participants.new participant_params

    if @participant.save
      flash[:success] = "Participant '#{@participant.decorate.full_name}' created"
    end

    redirect_to [:owner, @team.quiz, @team]
  end

  def edit
    @participant = @team.participants.find params[:id]
  end

  def update
    @participant = @team.participants.find params[:id]

    if @participant.update_attributes participant_params
      flash[:success] = "Participant '#{@participant.decorate.full_name}' updated"
      redirect_to [:owner, @team.quiz, @team]
    else
      render :edit
    end
  end

  def destroy
    @participant = @team.participants.find params[:id]

    if @participant.destroy
      flash[:success] = "Participant '#{@participant.decorate.full_name}' deleted"
    end

    redirect_to [:owner, @team.quiz, @team]
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :surname)
  end

  def find_team
    @team = Team.find params[:team_id]
  end
end
