class CreateBookAuthorTable < ActiveRecord::Migration[6.1]
  def change
    if !table_exists?(:book_authors)
      create_table :book_authors do |t|
        # t.integer :book_id
        # t.integer :author_id
        t.belongs_to :book
        t.belongs_to :author

        t.timestamps
      end
    end
  end
end
