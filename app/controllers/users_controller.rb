class UsersController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
