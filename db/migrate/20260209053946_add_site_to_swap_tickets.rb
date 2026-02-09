class AddSiteToSwapTickets < ActiveRecord::Migration[8.1]
  def change
    add_reference :swap_tickets, :site, null: false, foreign_key: true
  end
end
