class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  def create
    @book = Book.new
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    reditrct_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
