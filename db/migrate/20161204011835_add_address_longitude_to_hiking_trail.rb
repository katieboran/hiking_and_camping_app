class AddAddressLongitudeToHikingTrail < ActiveRecord::Migration[5.0]
  def change
    add_column :hiking_trails, :address_longitude, :float
  end
end
