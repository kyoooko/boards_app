class AddColumnToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :comment, :text, null: false
  end
end
