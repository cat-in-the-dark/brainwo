class AddDefaultToQuiz < ActiveRecord::Migration
  def change
    change_column :quizzes, :status, :string, default: 'moderating'
  end
end
