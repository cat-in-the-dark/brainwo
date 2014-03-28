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
  STATUSES = %w(alive killed)

  has_many :participants
  has_many :answers, class_name: TeamAnswer, inverse_of: :team
  has_many :questions, through: :answers
  belongs_to :quiz
  belongs_to :victim, class_name: Participant

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :quiz, presence: true

  scope :with_rating, -> { includes(:answers).references(:answers).order(:created_at) }

  def toggle_status!
    if self.status.eql?('alive')
      self.update_attribute :status, 'killed'
    else
      self.update_attribute :status, 'alive'
    end
  end

  def killed?
    status == 'killed'
  end

  def alive?
    status == 'alive'
  end
end
