class CreateTeamAnswers < ActiveRecord::Migration
  def change
    create_table :team_answers do |t|
      t.references :team, index: true
      t.references :question, index: true
      t.string :body
      t.boolean :is_right, default: false

      t.timestamps
    end
  end
end
