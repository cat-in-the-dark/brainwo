class CreateSufferings < ActiveRecord::Migration
  def change
    create_table :sufferings do |t|
      t.references :participant, index: true
      t.references :question, index: true
      t.integer :pain_count, null: false, default: 0

      t.timestamps
    end
    add_index :sufferings, [:participant_id, :question_id], unique: true

    add_column :questions, :pain_count, :integer, null: false, default: 0
    add_column :teams, :victim_id, :integer
  end
end
