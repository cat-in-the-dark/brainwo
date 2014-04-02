require 'spec_helper'

describe Question do
  let(:question) { FactoryGirl.create :question }

  subject { question }

  it { should respond_to :title }
  it { should respond_to :core }
  it { should respond_to :foreword }
  it { should respond_to :answer }
  it { should respond_to :quiz }
  it { should respond_to :team_answers }
  it { should respond_to :teams }
  it { should respond_to :pain_count }
  it { should respond_to :sufferings }
  it { should be_valid }

  it { should validate_presence_of(:quiz) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:core) }
  it { should validate_presence_of(:foreword) }
  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:pain_count) }

  it { should validate_numericality_of(:pain_count).only_integer.is_greater_than_or_equal_to(0) }

  it { should ensure_length_of(:title).is_at_most(50) }
  it { should ensure_length_of(:foreword).is_at_most(5000) }
  it { should ensure_length_of(:core).is_at_most(2000) }
  it { should ensure_length_of(:answer).is_at_most(2000) }
end
