class AddAddressLatitudeToPark < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :address_latitude, :float
  end
end
