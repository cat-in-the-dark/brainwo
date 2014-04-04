require 'spec_helper'

describe Owner::JudgementController do
  let(:owner) { FactoryGirl.create :owner }
  let(:quiz) { FactoryGirl.create :quiz, owner: owner }
  let(:question) { FactoryGirl.create :question, quiz: quiz, pain_count: 10 }
  let(:team) { FactoryGirl.create :team, quiz: question.quiz }
  let(:participant) { FactoryGirl.create :participant, team: team }

  before do
    controller.send(:sign_in, owner)
    @gs = GameService.new(quiz)
    @gs.start
    @gs.set_question(question.id)
    team.victim = participant
    team.save
  end

  describe 'POST #hurt 5' do
    it 'not increase participant suffering if game is not in punishment moode' do
      expect {
        post :hurt, quiz_id: quiz.id, team_id: team.id, pain_amount: 5
      }.to_not change(participant,:pain_count).by(5)
    end
  end

  context 'punishment mode on' do
    before do
      @gs.start_punishment
    end

    describe 'POST #hurt 5' do
      it 'increase participant suffering' do
        expect {
          post :hurt, quiz_id: quiz.id, team_id: team.id, pain_amount: 5
        }.to change(participant,:pain_count).by(5)
      end
    end

    describe 'POST #hurt 11 > 10' do
      it 'increase participant suffering to all_pain_count and no more' do
        expect {
          post :hurt, quiz_id: quiz.id, team_id: team.id, pain_amount: 11
        }.to change(participant,:pain_count).from(0).to(10)
      end
    end
  end
end
