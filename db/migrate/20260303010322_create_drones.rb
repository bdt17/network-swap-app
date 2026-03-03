class CreateDrones < ActiveRecord::Migration[8.1]
  def change
    create_table :drones do |t|
      t.string :identifier
      t.string :status
      t.integer :battery_level
      t.integer :fleet_id

      t.timestamps
    end
  end
end
