require 'spec_helper'

describe Owner::JudgementController do
  let(:owner) { FactoryGirl.create :owner }
  let(:quiz) { FactoryGirl.create :quiz, owner: owner }
  let(:question) { FactoryGirl.create :question, quiz: quiz }
  let(:team) { FactoryGirl.create :team, quiz: question.quiz }
  let(:participant) { FactoryGirl.create :participant, team: team }

  before do
    controller.send(:sign_in, owner)
    gs = GameService.new(quiz)
    gs.start
    gs.set_question(question.id)
    team.victim = participant
    team.save
  end

  describe 'POST #hurt 5' do
    it 'increase participant suffering' do
      expect {
        post :hurt, quiz_id: quiz.id, team_id: team.id, pain_amount: 5
      }.to change(participant,:pain_count).by(5)
    end
  end
end
