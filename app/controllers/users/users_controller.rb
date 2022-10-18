class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipe = @user.recipes.last
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated book successfully."
      redirect_to users_user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthday, :email)
  end
end
