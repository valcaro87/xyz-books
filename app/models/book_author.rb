# == Schema Information
#
# Table name: book_authors
#
#  id         :bigint           not null, primary key
#  book_id    :bigint
#  author_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BookAuthor < ApplicationRecord
  # belongs_to :book
  # belongs_to :author
end
