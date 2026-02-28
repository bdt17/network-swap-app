class AddFieldsToDroneFleet < ActiveRecord::Migration[8.1]
  def change
    add_column :drone_fleets, :make, :string
    add_column :drone_fleets, :model, :string
    add_column :drone_fleets, :last_seen, :datetime
    add_column :drone_fleets, :battery_level, :integer
    add_column :drone_fleets, :current_assignment, :string
    add_column :drone_fleets, :video_stream_url, :string
    add_reference :drone_fleets, :site, null: false, foreign_key: true
  end
end
