class BooksController < ApplicationController
  protect_from_forgery
  def new
  end

  def index
    @book = Book.new(book_params)
    @books = Book.all.order(created_at: :desc)
  end
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book =Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    reditrct_to books_path
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
