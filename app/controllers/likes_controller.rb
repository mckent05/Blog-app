class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    new_like = Like.new(author: user, post:)
    new_like.likes_counter_update

    respond_to do |format|
      format.html do
        if new_like.save
          flash[:success] = 'Liked'
          redirect_to user_post_path(current_user.id, post.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end
end
