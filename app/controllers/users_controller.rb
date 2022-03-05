class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def api_token
    @user = User.find(params[:id])
    render json: @user.api_token, status: :ok
    # respond_to do |format|
    #   format.html {  }
    # end
  end
end
