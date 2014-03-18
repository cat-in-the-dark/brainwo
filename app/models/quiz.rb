# == Schema Information
#
# Table name: quizzes
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  owner_id            :integer
#  status              :string(255)      default("moderating")
#  created_at          :datetime
#  updated_at          :datetime
#  current_question_id :integer
#

class Quiz < ActiveRecord::Base
  belongs_to :owner
  has_many :questions
  belongs_to :current_question, class_name: Question
  has_many :teams

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :owner
  validates :owner, presence: true
  validates :status, presence: true, inclusion: {in: GameService::STATUSES }


  scope :started, -> { where(status: 'started') }
end
