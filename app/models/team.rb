class Team < ActiveRecord::Base
  has_many :participants, dependent: :destroy
  has_many :answers, class_name: TeamAnswer, inverse_of: :team, dependent: :destroy
  has_many :questions, through: :answers
  belongs_to :quiz
  belongs_to :victim, class_name: Participant

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :quiz, presence: true
  validates :state, presence: true
  validates :logo, length: {maximum: 250 }

  default_scope { order(:created_at) }
  scope :with_rating, -> { includes(:answers).references(:answers).order(:created_at) }
  scope :alive, -> { where state: 'alive' }
  scope :killed, -> { where state: 'killed' }
  scope :with_answers_count, -> { 
    unscoped
    .joins(:answers)
    .select('teams.id, teams.name, teams.state, teams.logo, COUNT(teams.id) as right_answers_count')
    .where('team_answers.is_right = true')
    .group('team_answers.team_id, teams.name, teams.id')
    .order('right_answers_count DESC') }

  state_machine initial: :alive do
    event :kill do 
      transition :alive => :killed
    end

    event :reanimate do
      transition :killed => :alive
    end
  end
end
