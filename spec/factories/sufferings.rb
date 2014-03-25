# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suffering do
    participant
    question
    pain_count 10
  end
end
