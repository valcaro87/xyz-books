# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Author < ApplicationRecord
  has_many :book_authors

  scope :all_lists, -> { select(:first_name, :last_name, :id).map { |c| ["#{c.first_name} #{c.last_name}", c.id] } }

  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, allow_blank: false
  # validates :middle_name, length: { minimum: 1 }
end
