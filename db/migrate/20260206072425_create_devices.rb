class CreateDevices < ActiveRecord::Migration[8.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :type
      t.string :mac_address
      t.references :site, null: false, foreign_key: true
      t.string :vendor
      t.integer :status

      t.timestamps
    end
  end
end
