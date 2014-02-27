require 'spec_helper'

describe Quiz do
  let(:quiz) { FactoryGirl.create :quiz }

  subject { quiz }

  it { should respond_to :questions }
  it { should respond_to :name }
  it { should respond_to :teams }

  it { should be_valid }

  describe 'when name is not presence' do
    before do
      quiz.name = ''
    end

    it { should_not be_valid }
  end

  describe 'when owner is not presence' do
    before do
      quiz.owner = nil
    end

    it { should_not be_valid }
  end

  describe 'when name is already in use by the same owner' do
    let(:second_quiz) { FactoryGirl.build :quiz, owner: quiz.owner }

    before do
      second_quiz.name = quiz.name
    end

    subject { second_quiz }

    it { should_not be_valid }
  end
end
