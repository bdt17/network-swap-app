class AddFieldsToDroneFleet < ActiveRecord::Migration[8.1]
  def change
    add_column :drone_fleets, :manufacturer, :string
    add_column :drone_fleets, :api_key, :string
    add_column :drone_fleets, :capabilities, :text
    add_column :drone_fleets, :status, :string
  end
end
