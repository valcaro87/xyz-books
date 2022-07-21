class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :price, :year_publication, :image_url, :edition, :authors, :publisher
  # has_one :publisher, serializer: PublisherSerializer

  def authors
    (Author.where(id: object.book_authors.pluck(:author_id)).complete_name).flatten
  end

  def publisher
    object.publisher.name
  end
end
