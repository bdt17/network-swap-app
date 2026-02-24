class AddDetailsToDroneFleets < ActiveRecord::Migration[8.1]
  def change
    add_column :drone_fleets, :name, :string
    add_column :drone_fleets, :vendor, :string
    add_column :drone_fleets, :base_location, :string
    add_column :drone_fleets, :max_operational_range_km, :float
  end
end
