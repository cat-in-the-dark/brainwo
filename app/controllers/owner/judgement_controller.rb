class Owner::JudgementController < OwnerController
  before_action :build_game
  before_action :check_game_status, except: [:index]

  def index
    @teams = @game.teams.decorate
  end

  def show
    @team = @game.teams.find(params[:team_id]).decorate
    @ps = PainService.new(@team, @game)
  end

  def hurt
    @team = @game.teams.find_by(id: params[:team_id])
    ps = PainService.new(@team, @game)

    if ps.hurt!(params[:pain_amount].to_i)
      render json: { status: :accepted, pain: ps.pain_count, all_pain: ps.all_pain_count }
    else
      logger.info "GAME NOT IN PUNISH MODE"
      render json: { status: :not_accepted, pain: ps.pain_count, all_pain: ps.all_pain_count, msg: "victim not set" }
    end
  end

  def toggle_status
    @team = @game.teams.find_by(id: params[:team_id])
    ps = PainService.new(@team, @game)
    ps.kill_or_reanimate_team!
    
    render json: { status: :updated, life_status: @team.status }
  end

  private

  def build_game
    quiz = quizzes.with_teams.find params[:quiz_id]
    @game = GameService.new quiz
  end

  def check_game_status
    redirect_to [:owner, :quiz, :judgement] if @game.current_question.nil?
  end
end
