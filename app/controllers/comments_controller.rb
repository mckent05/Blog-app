class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    new_comment = Comment.new(author: current_user, post:, text: comment_params)
    new_comment.update_comment_counter

    respond_to do |format|
      format.html do
        if new_comment.save
          flash[:success] = 'Comment succesful'
          redirect_to user_post_path(current_user.id, post.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def comment_params
    params.require(:data).permit(:comment)[:comment]
  end
end
