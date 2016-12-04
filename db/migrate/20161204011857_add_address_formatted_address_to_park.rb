class AddAddressFormattedAddressToPark < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :address_formatted_address, :string
  end
end
