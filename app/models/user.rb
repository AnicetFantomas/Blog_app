class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  private

  def most_recent_posts
    posts.order('created_at DESC').limit(3)
  end
end
