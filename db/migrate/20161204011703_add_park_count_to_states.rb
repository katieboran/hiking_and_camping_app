class AddParkCountToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :parks_count, :integer
  end
end
