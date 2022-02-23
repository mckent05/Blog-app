class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  def comment_5_recent
    comments.order('created_at desc').limit(5)
  end

  def update_post_counter
    author.increment!(:postscounter)
  end
end
