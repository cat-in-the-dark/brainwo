class TeamAnswer < ActiveRecord::Base
  belongs_to :team, inverse_of: :answers
  belongs_to :question

  validates :team_id, presence: true
  validates :question_id, presence: true
  validates :is_right, inclusion: {in: [true, false]}
  validates_uniqueness_of :team, scope: :question
end
