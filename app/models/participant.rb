class Participant < ActiveRecord::Base
  belongs_to :team

  validates :team_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :surname, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :name, scope: :surname
end
