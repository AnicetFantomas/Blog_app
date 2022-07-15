class AddUsersToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comment, :string
    add_index :comments, :comment
  end
end
