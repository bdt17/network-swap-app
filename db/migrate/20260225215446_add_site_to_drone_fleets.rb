class AddSiteToDroneFleets < ActiveRecord::Migration[8.1]
  def change
    add_reference :drone_fleets, :site, null: false, foreign_key: true
  end
end
