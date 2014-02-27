# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participant do
    sequence(:name) { |n| "Vasia_#{n}" }
    sequence(:surname) {|n| "Pupkin_#{n}" }
    team
  end
end
