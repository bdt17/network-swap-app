class CreateDroneFleets < ActiveRecord::Migration[8.1]
  def change
    create_table :drone_fleets do |t|
      t.string :manufacturer
      t.string :api_key
      t.text :capabilities
      t.string :status

      t.timestamps
    end
  end
end
