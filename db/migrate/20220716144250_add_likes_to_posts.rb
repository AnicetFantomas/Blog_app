class AddLikesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :like, :string
    add_index :posts, :like
  end
end
