class QuizzesController < ParticipantsController
  skip_before_action :check_sticking, only: [:show, :should_i_reload_page] do |controller|
    params[:id] == current_game.quiz.id
  end

  def index
    @quizzes = Quiz.started.load
  end

  def show
    @game = GameService.new(Quiz.find(params[:id]))
    @question = @game.current_question

    stick_to_quiz @game.quiz
  rescue
    redirect_to :root
  end

  def should_i_reload_page
    @game = GameService.new(Quiz.find(params[:id]))
    #TODO pls fix me or rewrite, rly
    logger.info "Current question #{@game.current_question.id}. Remote #{params[:my_current_question_id]}"
    if @game.current_question.id != params[:my_current_question_id].to_i
      logger.info "RELOAD true"
      render json: {reload: true}
    else
      logger.info "RELOAD false"
      render json: {reload: false}
    end
  rescue
    logger.info "RELOAD true + fail"
    render json: {reload: true}
  end
end
