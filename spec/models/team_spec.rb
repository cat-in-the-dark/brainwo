require 'spec_helper'

describe Team do
  let(:team) { FactoryGirl.create :team }

  subject { team }

  it { should respond_to :name }
  it { should respond_to :participants }
  it { should respond_to :quiz }
  it { should be_valid }

  describe 'when name is already in use in this quiz' do
    let(:team_2) { FactoryGirl.build :team, quiz: team.quiz }
    before do
      team_2.name = team.name
    end

    subject { team_2 }
    it { should_not be_valid }
  end
end
