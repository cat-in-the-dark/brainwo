class AddForewordToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :foreword, :string
    rename_column :questions, :description, :core
  end
end
