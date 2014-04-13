class Owner::GameController < OwnerController
  before_action :build_game

  def start
    @game.start
    
    redirect_to owner_game_path(quiz_id: @game.quiz.id)
  end

  def close
    @game.close

    redirect_to owner_game_path(quiz_id: @game.quiz.id)
  end

  def show
    @questions = PaginatingDecorator.new(@game.quiz.questions.paginate(page: params[:page], per_page: 20))
  end

  def question
    @question = @game.questions.find params[:question_id]
  end

  def rate
    if @game.current_question
      @teams_answers = TeamsAnswersCollection.build(@game.teams, @game.current_question)
    else
      flash[:danger] = "Select question before"
      redirect_to owner_game_path(quiz_id: @game.quiz.id)
    end
  end

  def stop_punishment
    @game.stop_punishment
    
    redirect_to owner_game_path(quiz_id: @game.quiz.id)
  end

  def fill_teams_answers
    # WTF, plz remove this hell, make service, really!!!
    if @game.current_question && params_presence?
      rate_service = RateService.new(@game, answers_params, victims_params, question_params)
      @teams_answers = rate_service.teams_answers_collection

      if rate_service.rate
        if @game.need_punishment?
          @game.start_punishment
          redirect_to owner_game_question_path({quiz_id: @game.quiz.id, question_id: @game.current_question.id})
        else  
          @game.close_current_question
          redirect_to owner_game_path(quiz_id: @game.quiz.id)
        end
      else
        render :rate
      end
    else
      flash[:danger] = "Select question before"
      redirect_to owner_game_path(quiz_id: @game.quiz.id)
    end
  end

  def set_question
    if @game.set_question params[:question_id]
      flash[:success] = "Question showed to participants: #{@game.current_question.title}"
      redirect_to owner_game_question_path({quiz_id: @game.quiz.id, question_id: @game.current_question.id})
    else
      flash[:danger] = 'Game not started!'
      redirect_to owner_game_path(quiz_id: @game.quiz.id)
    end
  end

  private
  def build_game
    quiz = quizzes.find params[:quiz_id]
    @game = GameService.new quiz
  end

  def answers_params
    params.require(:teams_answers_collection)[:answers]
  rescue
    nil
  end

  def question_params
    params.require(:teams_answers_collection)[:question].permit(:pain_count)
  rescue
    nil
  end

  def victims_params
    params.require(:teams_answers_collection)[:victims]
  rescue
    nil
  end

  def params_presence?
    !answers_params.nil? && !question_params.nil? && !victims_params.nil?
  end
end
