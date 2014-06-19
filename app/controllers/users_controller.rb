class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.user_name}!"
      redirect_to questions_path
    else
      flash[:notice] = "Invalid Credentials"
      render "new"
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

end
