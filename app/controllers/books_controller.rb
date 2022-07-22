include BooksHelper

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def search
    @errors = []
    @isbn = (params[:isbn])&.scan(/[\da-z\s]/i)&.join

    if !(ISBN.valid?(@isbn))
      @errors << "Please provide correct ISBN"
    else
      isbn13 = isbn10_13(@isbn)
      isbn10 = isbn13_10(@isbn)
      @book = Book.where(isbn: [isbn10,isbn13,@isbn]).first
      @authors = (Author.where(id: @book.book_authors.pluck(:author_id)).complete_name).join(", ")
    end

  end

  def show; end

  def new
    @book = Book.new
    @publishers = Publisher.pluck(:name, :id)
    @authors = Author.all
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    @book.isbn = (params[:book][:isbn]).scan(/[\da-z\s]/i).join
    @publishers = Publisher.pluck(:name, :id)
    @authors = Author.all

    respond_to do |format|
      if @book.save
        author_ids = (params[:book_authors][:author_id]).compact
        author_ids.each do |author_id|
          @book.book_authors.create(author_id: author_id)
        end

        format.html { redirect_to books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :publisher_id, :price, :year_publication, :image_url, :edition)
  end
end
