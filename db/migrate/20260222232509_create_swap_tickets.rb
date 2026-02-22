class CreateSwapTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :swap_tickets do |t|
      t.references :device, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true
      t.string :vendor
      t.datetime :scheduled_at
      t.string :status
      t.text :issue
      t.string :priority

      t.timestamps
    end
  end
end
