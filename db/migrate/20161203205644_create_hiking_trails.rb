class CreateHikingTrails < ActiveRecord::Migration
  def change
    create_table :hiking_trails do |t|
      t.string :address
      t.string :distance
      t.integer :difficulty
      t.integer :park_id
      t.integer :review_id

      t.timestamps

    end
  end
end
