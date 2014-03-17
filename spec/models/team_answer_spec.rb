require 'spec_helper'

describe TeamAnswer do
  let(:team_answer) { FactoryGirl.create :team_answer }
  subject { team_answer }

  it { should respond_to :team }
  it { should respond_to :question }
  it { should respond_to :is_right }

  it { should be_valid }

  describe 'when team not presence' do
    before do
      team_answer.team = nil
    end
    it { should_not be_valid }
  end

  describe 'when question not presence' do
    before do
      team_answer.question = nil
    end
    it { should_not be_valid }
  end

  describe 'when is_right not presence' do
    before do
      team_answer.is_right = nil
    end
    it { should_not be_valid }
  end
end
