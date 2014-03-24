require 'spec_helper'

describe Team do
  let(:team) { FactoryGirl.create :team }

  subject { team }

  it { should respond_to :name }
  it { should respond_to :participants }
  it { should respond_to :answers }
  it { should respond_to :questions }
  it { should respond_to :quiz }
  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:quiz) }

  it { should ensure_length_of(:name).is_at_most(50) }

  #it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:quiz_id) }
end
