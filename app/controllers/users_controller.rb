class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
