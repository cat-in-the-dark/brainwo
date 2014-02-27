require 'spec_helper'

describe Participant do
  let(:participant) { FactoryGirl.create :participant }

  subject { participant }

  it { should respond_to :name }
  it { should respond_to :surname }
  it { should respond_to :team }
  it { should respond_to :quiz }
  it { should be_valid }

  describe 'when name not presence' do
    before do
      participant.name = ''
    end

    it { should_not be_valid }
  end

  describe 'when surname not presence' do
    before do
      participant.surname = ''
    end

    it { should_not be_valid }
  end

  describe 'when team not presence' do
    before do
      participant.team = nil
    end

    it { should_not be_valid }
  end

  describe 'when name and surname is already used in the team' do
    let(:participant_2) { FactoryGirl.build :participant, team: participant.team }

    before do
      participant_2.name = participant.name
      participant_2.surname = participant.surname
    end

    subject { participant_2 }

    it { should_not be_valid }
  end
end
