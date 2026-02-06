50.times { |i| Site.create!(name: "Phoenix Rack #{i+1}", location: "AZ DC #{i+1}") }
sites = Site.all
1000.times do |i|
  Device.create!({
    name: "Device-#{format('%04d', i+1)}",
    device_type: [:switch, :printer, :camera, :ap][i % 4],  # ← SYMBOLS
    mac_address: "AA:BB:CC:DD:EE:#{format('%02x', i)}",
    site: sites.sample,
    vendor: [:Cisco, :HP, :Ubiquiti, :Epson, :Aruba].sample,
    status: [:active, :eol, :scheduled][i % 3]  # ← SYMBOLS
  })
end
SwapTicket.create!(device: Device.first, site: Site.first, scheduled_at: 1.week.from_now, status: :pending)
puts "✅ Seeded #{Device.count} devices!"
