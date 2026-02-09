class CreateDrones < ActiveRecord::Migration[8.1]
  def change
    create_table :drones do |t|
      t.references :drone_fleet, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :vendor_identifier
      t.integer :status
      t.boolean :online
      t.integer :battery_level

      t.timestamps
    end
  end
end
