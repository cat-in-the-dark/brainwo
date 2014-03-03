class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :answer, presence: true
end
