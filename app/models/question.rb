# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  answer      :text
#  created_at  :datetime
#  updated_at  :datetime
#  quiz_id     :integer
#

class Question < ActiveRecord::Base
  belongs_to :quiz

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :answer, presence: true
  validates :quiz, presence: true
end
