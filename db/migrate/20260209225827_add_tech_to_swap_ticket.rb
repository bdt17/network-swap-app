class AddTechToSwapTicket < ActiveRecord::Migration[8.1]
  def change
    # tech_id already exists in CreateSwapTickets - SKIP
    puts "✅ tech_id already exists - migration skipped"
  end
end
