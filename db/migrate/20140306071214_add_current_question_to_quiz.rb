class AddCurrentQuestionToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :current_question_id, :integer
  end
end
