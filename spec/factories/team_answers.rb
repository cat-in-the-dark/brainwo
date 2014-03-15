# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team_answer do
    body "MyString"
    is_right true
    team
    question
  end
end
