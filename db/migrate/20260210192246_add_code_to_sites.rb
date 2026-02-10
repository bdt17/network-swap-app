class AddCodeToSites < ActiveRecord::Migration[8.1]
  def change
    add_column :sites, :code, :string
  end
end
