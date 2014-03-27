class AddStatusToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :status, :string, default: 'alive'
  end
end