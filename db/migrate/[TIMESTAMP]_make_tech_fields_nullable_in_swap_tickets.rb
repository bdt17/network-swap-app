class AddCodeToSites < ActiveRecord::Migration[8.1]
  def change
    add_column :sites, :code, :string, null: false, default: 'PHX21'
    Site.update_all(code: 'PHX21') rescue nil
  end
end
