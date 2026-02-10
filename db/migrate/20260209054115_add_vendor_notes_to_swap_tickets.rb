class AddVendorNotesToSwapTickets < ActiveRecord::Migration[8.1]
  def change
    # vendor column already exists in CreateSwapTickets - SKIP
    # Only add notes if it doesn't exist
    unless column_exists?(:swap_tickets, :notes)
      add_column :swap_tickets, :notes, :text
    end
    puts "✅ vendor already exists, notes added if needed - migration complete"
  end

  def column_exists?(table, column)
    ActiveRecord::Base.connection.column_exists?(table, column)
  end
end
