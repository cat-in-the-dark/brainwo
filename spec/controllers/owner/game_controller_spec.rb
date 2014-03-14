require 'spec_helper'

describe Owner::GameController do
  let(:owner) { FactoryGirl.create :owner }
  let(:quiz) { FactoryGirl.create :quiz, owner: owner }
  let(:question) { FactoryGirl.create :question, quiz: quiz }
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
end
