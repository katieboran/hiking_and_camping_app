class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.integer :state_id
      t.string :address
      t.datetime :dates_of_operation
      t.string :image
      t.string :activities

      t.timestamps

    end
  end
end
