class ChangeQuestionForewordType < ActiveRecord::Migration
  def change
    change_column :questions, :foreword, :text, null: false, default: ''
  end
end
