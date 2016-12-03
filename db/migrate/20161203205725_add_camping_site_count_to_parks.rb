class AddCampingSiteCountToParks < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :camping_sites_count, :integer
  end
end
