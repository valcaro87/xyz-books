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
    isbn = (params[:id])&.gsub("/[^0-9a-z ]/i", '')
    if !(ISBN.valid?(isbn))
      render json: { errors: "invalid ISBN" }, status: 400
    end
  end

  def set_book
    @book = Book.find_by_isbn(params[:id])
  end



end
