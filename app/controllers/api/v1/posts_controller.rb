class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end
end