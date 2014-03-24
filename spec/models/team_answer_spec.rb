require 'spec_helper'

describe TeamAnswer do
  let(:team_answer) { FactoryGirl.create :team_answer }
  subject { team_answer }

  it { should respond_to :team }
  it { should respond_to :question }
  it { should respond_to :is_right }

  it { should be_valid }

  it { should validate_presence_of(:team_id) }
  it { should validate_presence_of(:question_id) }
  #it { should validate_uniqueness_of(:team_id).scoped_to(:question_id) }
end
