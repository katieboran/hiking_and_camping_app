class AddHikingReviewCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hiking_reviews_count, :integer
  end
end
