# == Schema Information
#
# Table name: team_answers
#
#  id          :integer          not null, primary key
#  team_id     :integer
#  question_id :integer
#  body        :string(255)
#  is_right    :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class TeamAnswer < ActiveRecord::Base
  belongs_to :team, inverse_of: :answers
  belongs_to :question

  validates :team_id, presence: true
  validates :question_id, presence: true
  validates :is_right, inclusion: {in: [true, false]}
  validates_uniqueness_of :team, scope: :question
end
