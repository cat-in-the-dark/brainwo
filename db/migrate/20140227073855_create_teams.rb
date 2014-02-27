class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :quiz, index: true

      t.timestamps
    end
    add_index :teams, [:quiz_id, :name], unique: true
  end
end
