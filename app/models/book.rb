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
class Book < ApplicationRecord
  has_many :book_authors
  belongs_to :publisher

  validates :title, presence: true, length: {minimum: 2}
  validates :price, presence: true, allow_blank: false
  validates :year_publication, presence: true, allow_blank: false
  validates :image_url, presence: true, allow_blank: false
  validates :edition, presence: true, numericality: { only_integer: true}
  validate :valid_isbn_10

  def valid_isbn_10
    result = []
    isbn = self.isbn
    result << (isbn.count("/[^0-9]/i") < 9 ? false : true)
    sum = 0
    isbn = isbn.gsub(/[^0-9a-z ]/i, '').split("")
    isbn.each_with_index do |num, i|
      if i < isbn.length - 1
        digit = num.to_i
        if 0 > digit || 9 < digit
          result << false
        else
          sum += (digit * (10-i))
        end
      end
    end

    last = isbn.last
    result << ((last&.downcase != 'x' && (last.to_i < 0 || last.to_i > 9)) ? false : true)
    sum += ((last&.downcase == 'x') ? 10 : last.to_i)
    # p result.all? && sum % 11 == 0

    if !(result.all? && sum % 11 == 0)
      errors.add(:isbn, "Please provide correct ISBN")
    end
  end

end
