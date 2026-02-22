class CreateDrones < ActiveRecord::Migration[8.1]
  def change
    create_table :drones do |t|
      t.references :fleet, null: false, foreign_key: true
      t.string :serial
      t.string :status

      t.timestamps
    end
  end
end
