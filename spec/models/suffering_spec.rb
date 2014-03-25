require 'spec_helper'

describe Suffering do
  let(:suffering) { FactoryGirl.create :suffering }
  subject { suffering }

  it { should respond_to :participant }
  it { should respond_to :question }
  it { should respond_to :pain_count }

  it { should validate_presence_of(:participant) }
  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:pain_count) }

  it { should be_valid }
end
