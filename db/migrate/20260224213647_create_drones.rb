class CreateDrones < ActiveRecord::Migration[8.1]
  def change
    create_table :drones do |t|
      t.references :fleet, null: false, foreign_key: true
      t.string :identifier
      t.string :status
      t.integer :battery_level
      t.float :gps_lat
      t.float :gps_lng
      t.datetime :last_heartbeat

      t.timestamps
    end
  end
end
