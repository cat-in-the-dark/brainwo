class Team < ActiveRecord::Base
  has_many :participants

  validates :name, presence: true, uniqueness: true
  #validates_uniqueness_of :quiz_id, scope: :name
end
