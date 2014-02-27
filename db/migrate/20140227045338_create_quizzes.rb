class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :owner, index: true

      t.timestamps
    end
    add_index :quizzes, [:owner_id, :name], unique: true
  end
end
