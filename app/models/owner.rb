class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :quizzes

  def questions
    Question.joins(:quiz).where(:'quizzes.owner_id' => self.id)
  end
end
