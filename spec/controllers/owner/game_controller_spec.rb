require 'spec_helper'

describe Owner::GameController do
  let(:owner) { FactoryGirl.create :owner }
  let(:quiz) { FactoryGirl.create :quiz, owner: owner }
  let(:question) { FactoryGirl.create :question, quiz: quiz, pain_count: 10 }
  let(:team_1) { FactoryGirl.create :team, quiz: quiz }
  let(:team_2) { FactoryGirl.create :team, quiz: quiz }
  let(:victim_1) { FactoryGirl.create :participant, team: team_1 }
  let(:victim_2) { FactoryGirl.create :participant, team: team_2 }
  let(:game) { GameService.new(quiz) }

  before do
    controller.send(:sign_in, owner)
  end

  describe 'start game' do
    before do
      put :start, quiz_id: quiz.id
      quiz.reload
    end

    it { expect(game).to be_started }
  end

  describe 'close game' do
    before do
      put :close, quiz_id: quiz.id
      quiz.reload
    end

    it { expect(game).to be_closed }
  end

  describe 'POST #fill_team_answers' do
    context 'when game not started' do
      before do
        game.close
        post :fill_teams_answers, quiz_id: quiz.id
      end

      it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
    end

    context 'when game started' do
      before do
        #restart game, all right!
        game.close
        game.start
      end

      describe 'current question not set' do
        before { post :fill_teams_answers, quiz_id: quiz.id }

        it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
      end

      describe 'current question is setted' do
        before { game.set_question(question.id) }

        context 'send invalid params' do
          describe 'send empty params' do
            before { post :fill_teams_answers, quiz_id: quiz.id }
            
            it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
          end

          describe 'send only question params' do
            before { post :fill_teams_answers, quiz_id: quiz.id, teams_answers_collection: {question: {pain_count: 100}} }
            
            it { expect(game.current_question.pain_count).to be_eql 10 }
            it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
          end

          describe 'send only victims' do
            before do 
              team_1.victim = nil
              team_1.save
              post :fill_teams_answers, quiz_id: quiz.id, teams_answers_collection: {victims: {team_1.id.to_s => {victim_id: victim_1.id}}}
            end
          
            it { expect(team_1.reload.victim).to_not eq victim_1 }
            it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
          end

          describe 'send only answers' do
            before do
              post :fill_teams_answers, quiz_id: quiz.id, teams_answers_collection: {answers: {team_1.id.to_s => {is_right: 1, body: ''}, team_2.id.to_s => {is_right: 0, body: 'asfas'}}}
            end

            it { expect(team_1.answers.count).to eql 0 }
            it { expect(team_2.answers.count).to eql 0 }
            it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
          end
        end

        context 'send valid params' do
          describe 'pain_count zero' do
            before do
              post :fill_teams_answers, quiz_id: quiz.id, teams_answers_collection: {question: {pain_count: 0}, victims: {team_1.id.to_s => {victim_id: victim_1.id}, team_2.id.to_s => {victim_id: victim_2.id}}, answers: {team_1.id => {is_right: 1, body: ''}, team_2.id => {is_right: 0, body: 'asfas'}}}
            end

            after do
              team_1.answers.delete_all
              team_2.answers.delete_all
              question.update_attribute :state, 'unused'
            end

            it { expect(question.reload).to be_used }
            it { expect(team_1.answers.count).to eql 1 }
            it { expect(team_2.answers.count).to eql 1 }
            it { expect(team_1.reload.victim).to eq victim_1 }
            it { expect(response).to redirect_to owner_game_path(quiz_id: quiz.id) }
          end

          describe 'pain_count zero' do
            before do
              post :fill_teams_answers, quiz_id: quiz.id, teams_answers_collection: {question: {pain_count: 13}, victims: {team_1.id.to_s => {victim_id: victim_1.id}, team_2.id.to_s => {victim_id: victim_2.id}}, answers: {team_1.id => {is_right: 1, body: ''}, team_2.id => {is_right: 0, body: 'asfas'}}}
            end

            it { expect(game.current_question.reload).to be_punishment }
            it { expect(game.current_question.reload.pain_count).to eql 13 }
            it { expect(team_1.answers.count).to eql 1 }
            it { expect(team_2.answers.count).to eql 1 }
            it { expect(team_1.reload.victim).to eq victim_1 }
            it { expect(response).to redirect_to owner_game_question_path({quiz_id: game.quiz.id, question_id: game.current_question.id}) }
          end
        end
      end
    end
  end
end
