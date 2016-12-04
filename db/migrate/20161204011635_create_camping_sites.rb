class CreateCampingSites < ActiveRecord::Migration
  def change
    create_table :camping_sites do |t|
      t.string :capacity
      t.integer :review_id
      t.integer :park_id

      t.timestamps

    end
  end
end
