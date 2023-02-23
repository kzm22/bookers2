class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update, :destroy]
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end

    #@book = Book.new(book_params[:id])
    #@book.save
    #redirect_to 'books'
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user


  end

  def edit
    @book = Book.find(params[:id])
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def correct_book
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end
end
