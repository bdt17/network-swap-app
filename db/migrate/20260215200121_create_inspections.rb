class CreateInspections < ActiveRecord::Migration[8.1]
  def change
    create_table :inspections do |t|
      t.references :drone_fleet, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.text :issues
      t.integer :severity

      t.timestamps
    end
  end
end
