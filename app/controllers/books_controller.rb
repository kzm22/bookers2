class BooksController < ApplicationController
  def new
    @books = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books/show'
  end

  def index
    
  end

  def show
  end

  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body, :image)
  end
end
