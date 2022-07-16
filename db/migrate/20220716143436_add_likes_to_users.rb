class AddLikesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :like, :string
    add_index :users, :like
  end
end
