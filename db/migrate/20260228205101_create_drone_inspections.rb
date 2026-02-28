class CreateDroneInspections < ActiveRecord::Migration[8.1]
  def change
    create_table :drone_inspections do |t|
      t.references :site, null: false, foreign_key: true
      t.references :swap_ticket, null: false, foreign_key: true
      t.json :inspection_report
      t.string :status
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
