class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'

  validates :name, presence: true
  validates :postscounter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent3_posts
    posts.last(3)
  end
end
