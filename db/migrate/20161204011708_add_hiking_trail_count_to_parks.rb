class AddHikingTrailCountToParks < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :hiking_trails_count, :integer
  end
end
