class CreateDevicesTable < ActiveRecord::Migration[8.1]
  def change
    create_table :devices_tables do |t|
      t.string :mac_address
      t.string :model
      t.integer :site_id
      t.string :status
      t.date :warranty_expires

      t.timestamps
    end
    add_index :devices_tables, :mac_address, unique: true
  end
end
