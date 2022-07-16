class Post < ApplicationRecord
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
