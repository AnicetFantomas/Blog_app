class AddCommentsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :comment, :string
    add_index :users, :comment
  end
end
