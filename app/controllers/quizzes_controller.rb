class QuizzesController < ParticipantsController
  skip_before_action :check_sticking, only: [:show, :should_i_reload_page] do |controller|
    params[:id] == current_game.quiz.id
  end

  def index
    @quizzes = Quiz.started.load
  end

  def show
    @game = GameService.new(Quiz.started.find(params[:id]))
    @question = @game.current_question
    @question_id = @question.id if @question
    if request.env['HTTP_X_PJAX'].present? || params[:_pjax]
      response.headers['X-PJAX-URL'] = request.url
      render partial: 'quiz', layout: false
    else
      stick_to_quiz @game.quiz
    end
  rescue
    redirect_to :root
  end

  def should_i_reload_page
    @game = GameService.new(Quiz.find(params[:id]))
    #TODO pls fix me or rewrite, rly
    if @game.current_question
      if current_question_id_mismatched || game_state_mismatched
        render json: {reload: true}
      else
        render json: {reload: false}
      end
    else
      if params[:my_current_question_id].blank?
        render json: { reload: false }
      else
        render json: { reload: true }
      end
    end
  rescue
    logger.info "RELOAD false + fail"
    render json: { reload: false }
  end

  private

  def current_question_id_mismatched
    @game.current_question.id != params[:my_current_question_id].to_i
  end

  def game_state_mismatched
    @game.state != params[:my_game_state].to_s
  end
end
