class Like < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'users_id'

  def likes_counter_update
    post.increment!(:likescounter)
  end
end
