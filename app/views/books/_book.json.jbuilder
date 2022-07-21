json.extract! book, :id, :title, :isbn, :price, :year_publication, :image_url, :edition, :created_at, :updated_at
json.url book_url(book, format: :json)
