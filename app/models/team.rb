class Team < ActiveRecord::Base
  belongs_to :quiz
  has_many :participants

  validates :quiz_id, presence: true
  validates :name, presence: true
  validates_uniqueness_of :quiz_id, scope: :name
end
