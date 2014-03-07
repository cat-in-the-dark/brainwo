class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :owner, index: true
      t.string :status

      t.timestamps
    end
  end
end
