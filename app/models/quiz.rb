class Quiz < ActiveRecord::Base
  belongs_to :owner
  has_many :questions
  has_many :teams

  validates :owner_id, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :owner_id
end
