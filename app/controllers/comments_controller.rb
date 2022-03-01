class CommentsController < ApplicationController
  def create
    user_post = Post.find(params[:post_id])
    new_comment = Comment.new(author: current_user, post: user_post, text: comment_params)
    new_comment.update_comment_counter

    respond_to do |format|
      format.html do
        if new_comment.save
          flash[:success] = 'Comment succesful!'
          redirect_to user_post_path(current_user.id, user_post.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find_by(id: comment.post_id)
    post.commentscounter -= 1
    comment.destroy
  end

  private

  def comment_params
    params.require(:data).permit(:comment)[:comment]
  end
end
