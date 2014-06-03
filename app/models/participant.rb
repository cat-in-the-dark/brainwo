class Participant < ActiveRecord::Base
  belongs_to :team
  has_many :sufferings, class_name: Suffering, dependent: :destroy

  validates :team_id, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :surname, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :name, scope: :surname

  default_scope { order(:surname) }
  scope :with_pain_count, -> { 
    joins(:sufferings)
    .select('participants.team_id, participants.name, participants.surname, SUM(sufferings.pain_count) as total_pain_count')
    .group('sufferings.participant_id, participants.name, participants.surname, participants.team_id')
    .order('total_pain_count DESC') }

  def pain_count
    sufferings.sum(:pain_count)
  end
end
