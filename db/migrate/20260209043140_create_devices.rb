class CreateDevices < ActiveRecord::Migration[8.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :hostname
      t.string :inventory_tag
      t.string :rack_name
      t.integer :rack_unit
      t.references :site, null: false, foreign_key: true
      t.string :vendor
      t.integer :status

      t.timestamps
    end
  end
end
