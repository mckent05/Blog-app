class Api::V1::UsersController < ApplicationController
    # before_action :authenticate_user!
  
    def show
      @user = User.find(params[:id])
      render json: @user, status: :ok
    end
end