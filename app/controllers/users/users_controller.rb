class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_user_path
  end

  def user_params
    params.require(:user).permit(:name, :birthday, :email)
  end
end
