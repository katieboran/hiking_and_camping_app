class CreateHikingReviews < ActiveRecord::Migration
  def change
    create_table :hiking_reviews do |t|
      t.string :review_content
      t.integer :user_id
      t.integer :star_rating

      t.timestamps

    end
  end
end
