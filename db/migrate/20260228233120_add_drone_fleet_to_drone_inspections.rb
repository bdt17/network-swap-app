class AddDroneFleetToDroneInspections < ActiveRecord::Migration[8.1]
  def change
    add_reference :drone_inspections, :drone_fleet, null: false, foreign_key: true
  end
end
