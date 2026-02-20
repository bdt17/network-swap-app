class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    # Only add if columns don't exist
    add_column :users, :first_name, :string unless column_exists?(:users, :first_name)
    add_column :users, :last_name, :string unless column_exists?(:users, :last_name)
    add_column :users, :role, :string unless column_exists?(:users, :role)
    add_column :users, :phone, :string unless column_exists?(:users, :phone)
    add_column :users, :company, :string unless column_exists?(:users, :company)
  end
end
