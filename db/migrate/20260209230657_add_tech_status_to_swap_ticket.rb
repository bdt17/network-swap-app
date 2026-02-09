class AddTechStatusToSwapTicket < ActiveRecord::Migration[8.1]
  def change
    add_column :swap_tickets, :tech_status, :string
    add_column :swap_tickets, :tech_id, :integer
    add_column :swap_tickets, :tech_name, :string
  end
end
