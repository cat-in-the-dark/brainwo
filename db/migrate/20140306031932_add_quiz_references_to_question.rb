class AddQuizReferencesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :quiz_id, :integer, index: true
    add_column :teams, :quiz_id, :integer, index: true
  end
end
