class Suffering < ActiveRecord::Base
  belongs_to :participant
  belongs_to :question

  validates :pain_count, presence: true
  validates :participant, presence: true
  validates :question, presence: true
end
