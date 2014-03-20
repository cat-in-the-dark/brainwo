class AddUniqIndexOnTeamAnswers < ActiveRecord::Migration
  def change
    add_index :team_answers, [:team_id, :question_id], unique: true
  end
end
