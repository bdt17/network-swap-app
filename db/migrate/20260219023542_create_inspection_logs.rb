class CreateInspectionLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :inspection_logs do |t|
      t.references :drone_fleet, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.text :findings
      t.string :status

      t.timestamps
    end
  end
end
