# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "question#{n}"}
    description "MyText"
    answer "MyText"
    quiz
  end
end
