class CreateSites < ActiveRecord::Migration[8.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.text :address
      t.string :region
      t.decimal :distance_km_from_hub

      t.timestamps
    end
  end
end
