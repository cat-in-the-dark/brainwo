# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  quiz_id    :integer
#

class Team < ActiveRecord::Base
  has_many :participants
  belongs_to :quiz

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
