class Quiz < ActiveRecord::Base
  STATUSES = [:moderating, :started, :closed]

  belongs_to :owner
  has_many :questions
  belongs_to :current_question, class_name: Question, foreign_key: :current_question_id
  has_many :teams

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :owner
  validates :owner, presence: true

  scope :started, -> { where(status: :started) }

  def start!
    update_attribute :status, :started
  end

  def close!
    update_attribute :status, :closed
    update_attribute :current_question_id, nil
  end

  def started?
    status && status.to_sym == :started
  end

  def closed?
    status && status.to_sym == :closed
  end

  def set_next_question!(question)
    if started? && question.quiz == self
      self.current_question = question
      self.save
    end
  end
end
