class BookAuthor < ActiveRecord::Migration[6.1]
  def change
    create_table :book_authors do |t|
      # t.integer :book_id
      # t.integer :author_id
      t.belongs_to :book
      t.belongs_to :author

      t.timestamps
    end
  end
end
