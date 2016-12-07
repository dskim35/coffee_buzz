class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.integer :shop_id
      t.integer :review_id

      t.timestamps

    end
  end
end
