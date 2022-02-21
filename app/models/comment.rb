class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  after_save :update_comment_counter

  private

  def update_comment_counter
    post.increment!(:commentscounter)
  end
end
