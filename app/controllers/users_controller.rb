class UsersController < ApplicationController 
  def new
    @user = User.new
    render :new
  end 

  def create 
    @user = User.new(user_params)
    @user.location = Location.all.sample
    if @user.save
      login!(@user)
      redirect_to blabs_url
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end
end