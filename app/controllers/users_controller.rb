class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @user = User.find(params[:id])
    @users = User.all
    @books = @user.books
    @book = Book.new
  end
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
     @user.save
      redirect_to user_path(@user)
      flash[:notice] = "You have updated successfully."
    else
      render :edit
    end
  end
  def edit
    @user = User.find(params[:id])
    if @user == current_user
            render "edit"
    else
      redirect_to user_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
