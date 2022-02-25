class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'

  def recent3_posts
    posts.last(3)
  end
end
