puts "🌱 Thomas IT Network Swap - FINAL SEED..."

# Truncate
ActiveRecord::Base.connection.execute("TRUNCATE TABLE sites, devices, swap_tickets RESTART IDENTITY CASCADE")

# Sites (5)
5.times { |i| Site.create!(name: "Phoenix DC #{i}", location: "Rack #{i}") }

# Devices (50)  
50.times do |i|
  Device.create!(name: "Switch-#{i}", site_id: Site.first.id, status: "active")
end

# Swaps (NO priority/vendor_notes - use existing columns only)
10.times do |i|
  SwapTicket.create!(device_id: Device.first.id, status: "pending")
end

puts "✅ Seeded: #{Site.count} sites, #{Device.count} devices, #{SwapTicket.count} swaps"
