class AddNameVendorToDroneFleets < ActiveRecord::Migration[8.1]
  def change
    add_column :drone_fleets, :name, :string
    add_column :drone_fleets, :vendor, :integer
    add_column :drone_fleets, :description, :text
  end
end
