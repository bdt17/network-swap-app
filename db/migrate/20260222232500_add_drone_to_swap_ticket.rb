class AddDroneToSwapTicket < ActiveRecord::Migration[8.1]
  def change
    add_reference :swap_tickets, :drone, null: false, foreign_key: true
  end
end
