class CreateSwapTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :swap_tickets do |t|
      t.integer :device_id, null: false
      t.string :vendor, null: false
      t.string :status, null: false, default: 'scheduled'
      t.integer :assigned_tech_id, null: false, default: 1
      t.references :site, null: false, foreign_key: true
      t.datetime :scheduled_at, null: false
      t.string :tech_status
      t.integer :tech_id
      t.text :notes
      t.timestamps
    end
    add_index :swap_tickets, :device_id, unique: true
  end
end
