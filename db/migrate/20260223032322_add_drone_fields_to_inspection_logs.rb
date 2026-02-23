class AddDroneFieldsToInspectionLogs < ActiveRecord::Migration[8.1]
  def change
    add_column :inspection_logs, :site_id, :integer
    add_column :inspection_logs, :drone_fleet_id, :integer
  end
end
