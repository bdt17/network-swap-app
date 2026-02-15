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


puts "🌱 Seeding Dispatch Tower test data..."
Device.create!([{
  name: 'Cisco-2960-24TT', status: 'critical', site_id: 1
}, {
  name: 'Aruba-AP-305', status: 'online', site_id: 2
}, {
  name: 'HP-LaserJet-Pro', status: 'maintenance', site_id: 1
}])

# Site.create!([{
#   name: 'PHX-DC1', location: 'Phoenix Data Center 1'
}, {
  name: 'DEN-DC1', location: 'Denver Data Center 1'
}])

SwapTicket.create!([{
  device_id: 1, site_id: 1, status: 'pending', 
  priority: 'critical', assigned_tech: 'Smith,J. #2001', eta: '2hr'
}, {
  device_id: 2, site_id: 2, status: 'assigned', 
  priority: 'high', assigned_tech: 'Garcia,M. #2005', eta: '4hr'
}, {
  device_id: 3, site_id: 1, status: 'pending', 
  priority: 'medium', assigned_tech: nil, eta: '6hr'
}])

puts "✅ Dispatch Tower seeded: 3 tickets ready!"

puts "Seeding Phase 14/10..."

# Phoenix field tech
unless FieldTech.exists?
  FieldTech.create!(
    email: 'tech1@thomasit.com',
    password: 'password123',
    ar_glasses_token: SecureRandom.hex(16),
    gps_lat: 33.4484,    # Phoenix
    gps_lng: -112.0740
  )
  puts "✅ FieldTech created"
end

# Test drone inspection
if DroneFleet.exists? && Site.exists?
  Inspection.create!(
    drone_fleet_id: DroneFleet.first.id,
    site_id: Site.first.id,
    issues: 'Loose Cat6 in rack 3, overheating PSU detected',
    severity: :high
  )
  puts "✅ Inspection created"
end

puts "Phase 14/10 seed complete!"
