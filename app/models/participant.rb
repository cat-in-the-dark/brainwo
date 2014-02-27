class Participant < ActiveRecord::Base
  belongs_to :team
  delegate :quiz, to: :team

  validates :team_id, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates_uniqueness_of :team_id, scope: [:name, :surname]
end
