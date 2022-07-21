# == Schema Information
#
# Table name: books
#
#  id               :bigint           not null, primary key
#  title            :string
#  isbn             :string
#  price            :string
#  year_publication :string
#  image_url        :string
#  edition          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  publisher_id     :bigint           not null
#
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :price, :year_publication, :image_url, :edition

  # has_many :book_authors

end
