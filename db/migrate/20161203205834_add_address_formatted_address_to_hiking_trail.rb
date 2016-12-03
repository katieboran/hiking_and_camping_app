class AddAddressFormattedAddressToHikingTrail < ActiveRecord::Migration[5.0]
  def change
    add_column :hiking_trails, :address_formatted_address, :string
  end
end
