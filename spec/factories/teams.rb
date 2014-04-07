# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "SuperTeam_#{n}" }
    logo 'http://cs614926.vk.me/v614926738/90fc/_HDTHI3IshQ.jpg'
    victim nil
    quiz
  end
end
