class AddTechStatusToSwapTicket < ActiveRecord::Migration[8.1]
  def change
    # tech_status already exists in CreateSwapTickets - SKIP
    puts "✅ tech_status already exists - migration skipped"
  end
end
