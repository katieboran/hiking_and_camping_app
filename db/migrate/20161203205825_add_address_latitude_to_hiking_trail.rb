class AddAddressLatitudeToHikingTrail < ActiveRecord::Migration[5.0]
  def change
    add_column :hiking_trails, :address_latitude, :float
  end
end
