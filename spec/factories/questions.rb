# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    sequence(:title) {|n| "question#{n}"}
    core "Participants see this core"
    foreword "Only owner see this and read for participants"
    answer "MyText"
    pain_count 50
    quiz
  end
end
