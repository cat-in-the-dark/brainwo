class Team < ActiveRecord::Base
  has_many :participants

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
