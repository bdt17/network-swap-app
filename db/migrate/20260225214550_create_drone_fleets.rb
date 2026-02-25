class CreateDroneFleets < ActiveRecord::Migration[8.1]
  def change
    create_table :drone_fleets do |t|
      t.string :manufacturer
      t.string :api_key
      t.integer :status
      t.references :site, null: false, foreign_key: true
      t.timestamps
    end
  end
end
