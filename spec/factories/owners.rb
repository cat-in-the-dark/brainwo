# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    sequence(:email) { |n| "owner#{n}@gmail.com"}
    password 'qwertyui'
    password_confirmation 'qwertyui'
  end
end
