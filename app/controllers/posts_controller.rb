class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    post.likescounter = 0
    post.commentscounter = 0
    post.update_post_counter
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Created New Post succesfully!'
          redirect_to user_post_path(current_user.id, post.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find_by(id: post.users_id)
    user.postscounter -= 1
    post.destroy
    user.save
    redirect_to user_posts_path(user.id)
    flash[:success] = 'Post Deleted!'
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
