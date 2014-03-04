class Question < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :answer, presence: true
end
