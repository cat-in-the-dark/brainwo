class Question < ActiveRecord::Base
  belongs_to :quiz

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :answer, presence: true
  validates :quiz, presence: true
end
