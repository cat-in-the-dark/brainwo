class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :surname
      t.references :team, index: true

      t.timestamps
    end
  end
end
