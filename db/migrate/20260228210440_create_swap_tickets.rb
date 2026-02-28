class CreateSwapTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :swap_tickets do |t|
      t.string :title
      t.references :site, null: false, foreign_key: true
      t.string :status
      t.datetime :requested_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
