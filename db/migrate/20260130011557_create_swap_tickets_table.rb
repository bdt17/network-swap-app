class CreateSwapTicketsTable < ActiveRecord::Migration[8.1]
  def change
    create_table :swap_tickets_tables do |t|
      t.integer :device_id
      t.integer :site_id
      t.date :scheduled_for
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
