require 'spec_helper'

describe Quiz do
  let(:quiz) { FactoryGirl.create :quiz }

  subject { quiz }

  it { should respond_to :name }
  it { should respond_to :questions }
  it { should respond_to :teams }
  it { should respond_to :owner }

  it { should respond_to :status }

  it { should be_valid }

  describe 'ititial status' do
    its(:status) { should be_eql 'moderating' }
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
end
