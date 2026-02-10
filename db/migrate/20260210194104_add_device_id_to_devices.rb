class AddDeviceIdToDevices < ActiveRecord::Migration[8.1]
  def change
    add_column :devices, :device_id, :integer, null: false, unique: true
    add_index :devices, :device_id, unique: true
  end
end
