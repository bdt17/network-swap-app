# Clean slate
Device.delete_all
Site.delete_all
SwapTicket.delete_all

# Create test sites first
5.times do |i|
  site = Site.create!(
    name: "DC-#{i+1}",
    address: "123 Rack St, Phoenix, AZ",
    region: "US-West",
    distance_km_from_hub: (i+1) * 50
  )

  # Create 100 devices per site
  100.times do |j|
    Device.create!(
      name: "SW-#{i*100+j+1}",
      hostname: "switch-#{i}-#{j+1}.thomasit.local",
      inventory_tag: "IT-#{format('%05d', i*100+j+1)}",
      rack_name: "Rack-#{j%10 + 1}",
      rack_unit: rand(1..42),
      site: site,
      vendor: %w[Cisco Arista Juniper][rand(3)],
      status: rand(0..3)  # 0=online, 1=EOL, 2=failed, 3=maintenance
    )
  end
end

puts "Seeded #{Device.count} devices across #{Site.count} sites"

