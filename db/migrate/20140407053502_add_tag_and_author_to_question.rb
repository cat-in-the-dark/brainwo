class AddTagAndAuthorToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :tags, :string
    add_column :questions, :author, :string
  end
end
