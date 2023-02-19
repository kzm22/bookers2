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
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @books = Book.all
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
