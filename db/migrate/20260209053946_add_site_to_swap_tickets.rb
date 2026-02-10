class AddSiteToSwapTickets < ActiveRecord::Migration[8.1]
  def change
    # site_id already exists in CreateSwapTickets - SKIP
    puts "✅ site_id already exists - migration skipped"
  end
end
