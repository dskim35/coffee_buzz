class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :shop_id
      t.integer :user_id
      t.text :review

      t.timestamps

    end
  end
end
