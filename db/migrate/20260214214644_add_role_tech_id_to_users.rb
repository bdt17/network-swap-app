class AddRoleTechIdToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :role, :string, default: 'tech'
    add_column :users, :tech_id, :string
  end
end
