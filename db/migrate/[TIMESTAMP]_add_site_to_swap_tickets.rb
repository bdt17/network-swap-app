class AddSiteToSwapTickets < ActiveRecord::Migration[8.1]
  def change
    add_reference :swap_tickets, :site, null: false, foreign_key: true
    add_column :swap_tickets, :vendor, :string, null: false
    add_column :swap_tickets, :notes, :text
  end
end
