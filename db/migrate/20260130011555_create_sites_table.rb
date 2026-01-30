class CreateSitesTable < ActiveRecord::Migration[8.1]
  def change
    create_table :sites_tables do |t|
      t.string :name
      t.text :address
      t.string :timezone

      t.timestamps
    end
  end
end
