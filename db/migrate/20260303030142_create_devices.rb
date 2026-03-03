class CreateDevices < ActiveRecord::Migration[8.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.references :site, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
