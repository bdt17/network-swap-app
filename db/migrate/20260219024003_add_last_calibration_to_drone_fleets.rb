class AddLastCalibrationToDroneFleets < ActiveRecord::Migration[8.1]
  def change
    add_column :drone_fleets, :last_calibration, :datetime
  end
end
