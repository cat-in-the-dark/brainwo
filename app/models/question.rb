class Question < ActiveRecord::Base
  belongs_to :quiz

  validates :quiz_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :answer, presence: true
end
