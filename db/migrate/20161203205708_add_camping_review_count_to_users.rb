class AddCampingReviewCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :camping_reviews_count, :integer
  end
end
