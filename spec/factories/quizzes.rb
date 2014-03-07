# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "quiz_#{n}" }
    owner
  end
end
