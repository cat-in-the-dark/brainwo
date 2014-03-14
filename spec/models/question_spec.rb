require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create :question }

  subject { question }

  it { should respond_to :title }
  it { should respond_to :core }
  it { should respond_to :foreword }
  it { should respond_to :answer }
  it { should respond_to :quiz }
  it { should be_valid }

  describe 'when quiz is not presence' do
    before do
      question.quiz = nil
    end

    it { should_not be_valid }
  end

  describe 'when title is not presence' do
    before do
      question.title = ''
    end

    it { should_not be_valid }
  end

  describe 'when core is not presence' do
    before do
      question.core = ''
    end

    it { should_not be_valid }
  end

  describe 'when foreword is not presence' do
    before do
      question.foreword = ''
    end

    it { should_not be_valid }
  end

  describe 'when answer is not presence' do
    before do
      question.answer = ''
    end

    it { should_not be_valid }
  end

  describe 'when title too long' do
    before do
      question.title = 'a' * 51
    end
    it { should_not be_valid }
  end
end
