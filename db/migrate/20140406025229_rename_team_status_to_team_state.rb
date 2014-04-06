class RenameTeamStatusToTeamState < ActiveRecord::Migration
  def change
    rename_column :teams, :status, :state
    Team.update_all state: 'alive'
  end
end
