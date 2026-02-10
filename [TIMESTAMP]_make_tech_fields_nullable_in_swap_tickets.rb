class AddDeviceIdToDevices < ActiveRecord::Migration[8.1]
  def change
    add_column :devices, :device_id, :integer, null: false, unique: true
    Device.update_all(device_id: SecureRandom.uuid[0..7].to_i) rescue nil
    add_index :devices, :device_id, unique: true
  end
end
