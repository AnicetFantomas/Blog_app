class Post < ApplicationRecord
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true, length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
