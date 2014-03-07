class Team < ActiveRecord::Base
  has_many :participants
  belongs_to :quiz

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
