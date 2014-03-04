require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create :question }

  subject { question }

  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :answer }
  it { should be_valid }

  describe 'when title is not presence' do
    before do
      question.title = ''
    end

    it { should_not be_valid }
  end

  describe 'when description is not presence' do
    before do
      question.description = ''
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
