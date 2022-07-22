include BooksHelper

class Api::V1::BooksController < Api::V1::ApiController

  before_action :check_isbn, :set_book, only: %i[ show ]

  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def show
    render json: @book, status: 200
  end

  private

  def check_isbn
    @isbn = (params[:id]).scan(/[\da-z\s]/i).join
    if !(ISBN.valid?(@isbn))
      render json: { errors: "INVALID ISBN" }, status: 400
    end
  end

  def set_book
    # try to find either 10 or 13 or convert vice-versa
    isbn13 = isbn10_13(@isbn)
    isbn10 = isbn13_10(@isbn)
    @book = Book.where(isbn: [isbn10,isbn13,@isbn]).first

    if @book
      @book
    else
      render json: { errors: "BOOK NOT EXIST" }, status: 404
    end
  end

end
