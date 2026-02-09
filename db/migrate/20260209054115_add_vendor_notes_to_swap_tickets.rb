class AddVendorNotesToSwapTickets < ActiveRecord::Migration[8.1]
  def change
    add_column :swap_tickets, :vendor, :string
    add_column :swap_tickets, :notes, :text
  end
end
