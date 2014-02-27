class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.text :answer
      t.references :quiz, index: true

      t.timestamps
    end
  end
end
