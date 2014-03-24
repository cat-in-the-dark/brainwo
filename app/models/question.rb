# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  core       :text
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#  quiz_id    :integer
#  foreword   :string(255)
#

class Question < ActiveRecord::Base
  has_many :team_answers, class_name: TeamAnswer
  has_many :teams, through: :team_answers
  belongs_to :quiz

  validates :title, presence: true, length: { maximum: 50 }
  validates :core, presence: true, length: { maximum: 2000 }
  validates :foreword, presence: true, length: { maximum: 5000 }
  validates :answer, presence: true, length: { maximum: 2000 }
  validates :quiz, presence: true
end
