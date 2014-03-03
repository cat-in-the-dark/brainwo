require 'spec_helper'

describe Owner do
  let(:owner) { FactoryGirl.create :owner }

  subject { owner }

  it { should be_valid }
end
