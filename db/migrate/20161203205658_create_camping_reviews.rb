class CreateCampingReviews < ActiveRecord::Migration
  def change
    create_table :camping_reviews do |t|
      t.string :review_content
      t.integer :user_id
      t.integer :star_rating

      t.timestamps

    end
  end
end
