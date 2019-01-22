class Api::UsersController < ApplicationController 

  def index
    @users = User.all 
    # render json: @users, status: 200
    render :index
  end

  def show 
    @user = User.find(params[:id])
    # render json: @user, status: 200
    render :show
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end
end