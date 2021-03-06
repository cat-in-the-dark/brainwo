class Question < ActiveRecord::Base
  has_many :sufferings, class_name: Suffering, dependent: :destroy
  has_many :team_answers, class_name: TeamAnswer, dependent: :destroy
  has_many :teams, through: :team_answers
  belongs_to :quiz

  validates :title, presence: true, length: { maximum: 50 }
  validates :author, length: { maximum: 50 }
  validates :tags, length: { maximum: 100 }
  validates :core, presence: true, length: { maximum: 2000 }
  validates :foreword, presence: true, length: { maximum: 5000 }
  validates :answer, presence: true, length: { maximum: 2000 }
  validates :pain_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quiz, presence: true

  scope :with_answers, -> { includes(:team_answers).references(:team_answers) }

  state_machine initial: :unused do
    event :make_used do 
      transition [:punishment, :unused] => :used
    end

    event :start_punishment do
      transition [:used, :unused] => :punishment
    end
  end 
end
