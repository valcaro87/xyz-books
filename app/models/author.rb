# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string

class Author < ApplicationRecord
  has_many :book_authors

  # scope :all_lists, -> { select(:first_name, :last_name, :id).map { |c| ["#{c.first_name} #{c.last_name}", c.id] } }
  scope :complete_name, -> { select(:first_name, :last_name).map { |c| ["#{c.first_name} #{c.last_name}"] } }

  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, allow_blank: false

  def complete_names
    "#{first_name} #{last_name}"
  end

end
