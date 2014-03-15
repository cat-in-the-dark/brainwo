class TeamAnswer < ActiveRecord::Base
  belongs_to :team
  belongs_to :question

  validates :team_id, presence: true
  validates :question_id, presence: true
  validates :is_right, presence: true
end
