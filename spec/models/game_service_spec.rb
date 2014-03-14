require 'spec_helper'

describe GameService do
  let(:quiz) { FactoryGirl.create :quiz }
  let(:game) { GameService.new(quiz) }
  subject { game }

  it { should respond_to :start }
  it { should respond_to :close }
  it { should respond_to :started? }
  it { should respond_to :closed? }
  it { should respond_to :current_question }
  it { should respond_to :set_question }
  it { should respond_to :quiz }
  it { should respond_to :questions }

  describe 'when start game' do
    before do
      game.start
    end
    subject { quiz.reload }

    its(:status) { should be_eql 'started' }

    describe 'when close started game' do
      before do
        game.close
      end
      subject { quiz.reload }

      its(:status) { should be_eql 'closed' }
    end
  end

  describe 'when set next question' do
    let(:question) { FactoryGirl.create :question, quiz: quiz }
    
    before do
      game.start
      game.set_question question.id 
    end

    it {
      expect(game.current_question).to eq(question)
    }
  end

  describe 'when quiz not started' do
    let(:question) { FactoryGirl.create :question, quiz: quiz }

    before do
      game.set_question question.id
    end
    subject { quiz.reload }

     its(:current_question) { should_not be question }
  end

  describe 'when question is not for this quiz' do
    let(:question) { FactoryGirl.create :question }

    before do
      game.start
      game.set_question question.id
    end
    subject { quiz.reload }

     its(:current_question) { should_not be question }
  end
end