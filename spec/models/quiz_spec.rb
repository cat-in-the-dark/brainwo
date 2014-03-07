require 'spec_helper'

describe Quiz do
  let(:quiz) { FactoryGirl.create :quiz }

  subject { quiz }

  it { should respond_to :name }
  it { should respond_to :questions }
  it { should respond_to :teams }
  it { should respond_to :owner }

  it { should respond_to :status }
  it { should respond_to :start! }
  it { should respond_to :close! }
  it { should respond_to :started? }
  it { should respond_to :closed? }
  it { should respond_to :current_question }
  it { should respond_to :set_next_question! }

  it { should be_valid }

  describe 'ititial status' do
    it { should_not be_started }
    it { should_not be_closed }
    its(:current_question) { should be_eql nil }
  end

  describe 'when name is empty' do
    before do
      quiz.name = ''
    end

    it { should_not be_valid }
  end

  describe 'when owner not set' do
    before do
      quiz.owner = nil
    end

    it { should_not be_valid }
  end

  describe 'when name is already in use by this owner' do
    let(:quiz_2) { FactoryGirl.build :quiz, owner: quiz.owner }
    before do
      quiz_2.name = quiz.name
    end

    subject { quiz_2 }
    it { should_not be_valid }
  end

  describe 'when name is already in use by other owner' do
    let(:quiz_2) { FactoryGirl.build :quiz }
    before do
      quiz_2.name = quiz.name
    end

    subject { quiz_2 }
    it { should be_valid }
  end

  describe 'when start quiz' do
    before do
      quiz.start!
    end

    its(:status) { should be_eql :started }
    it { should be_started }

    describe 'when close started quiz' do
      before do
        quiz.close!
      end

      its(:status) { should be_eql :closed }
      it { should be_closed }
    end
  end

  describe 'when set next question' do
    let(:question) { FactoryGirl.create :question, quiz: quiz }
    
    before do
      quiz.start!
      quiz.set_next_question! question 
    end

    its(:current_question) { should be question }
  end

  describe 'when quiz not started' do
      let(:question) { FactoryGirl.create :question, quiz: quiz }

      before do
        quiz.set_next_question! question
      end

       its(:current_question) { should_not be question }
  end

  describe 'when question is not for this quiz' do
      let(:question) { FactoryGirl.create :question }

      before do
        quiz.start!
        quiz.set_next_question! question
      end

       its(:current_question) { should_not be question }
  end
end
