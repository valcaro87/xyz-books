class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :price
      t.string :year_publication
      t.string :image_url
      t.string :edition

      t.timestamps
    end
  end
end
