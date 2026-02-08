class CreateDroneFleets < ActiveRecord::Migration[8.1]
  def change
    create_table :drone_fleets do |t|
      t.string :serial_number
      t.string :firmware_version
      t.integer :battery_status
      t.string :location
      t.boolean :available

      t.timestamps
    end
  end
end
