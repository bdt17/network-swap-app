class AddTechToSwapTicket < ActiveRecord::Migration[8.1]
  def change
    add_column :swap_tickets, :tech_id, :integer
  end
end
