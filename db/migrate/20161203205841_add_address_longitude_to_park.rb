class AddAddressLongitudeToPark < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :address_longitude, :float
  end
end
