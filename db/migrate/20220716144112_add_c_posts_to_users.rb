class AddCPostsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :post, :string
    add_index :users, :post
  end
end
