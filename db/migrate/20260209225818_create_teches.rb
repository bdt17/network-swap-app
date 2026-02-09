class CreateTeches < ActiveRecord::Migration[8.1]
  def change
    create_table :teches do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :site_id
      t.integer :role
      t.string :status

      t.timestamps
    end
  end
end
