class AddStateToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :state, :string, index: true
  end
end
