class Quiz < ActiveRecord::Base
  belongs_to :owner
  has_many :questions, dependent: :destroy
  belongs_to :current_question, class_name: Question
  has_many :teams, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :owner
  validates :owner, presence: true
  validates :status, presence: true, inclusion: {in: GameService::STATUSES }

  scope :with_teams, -> { includes(:teams).references(:teams) }
  scope :started, -> { where(status: 'started') }
end
