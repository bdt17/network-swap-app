# Thomas IT Phoenix DC21 - CORE DATA ONLY
phx_site = Site.create!(name: 'Phoenix DC21', address: '85003')
fleet = DroneFleet.create!(name: 'DJI Phoenix HQ', vendor: 'DJI', site_id: phx_site.id)

Drone.create!([
  {fleet: fleet, identifier: 'DJI-PHX-179', status: 'online', battery_level: 87},
  {fleet: fleet, identifier: 'DJI-PHX-180', status: 'charging', battery_level: 45}
])

Device.create!([
  {name: 'Cisco C9300-24T Rack3U', site_id: phx_site.id, status: 'EOL'},
  {name: 'Cisco IE3400 Rack4B', site_id: phx_site.id, status: 'operational'},
  {name: 'Aruba AP-515 Rack2A', site_id: phx_site.id, status: 'needs_firmware'}
])

puts "✅ Phoenix DC21: #{Device.count} devices, #{Drone.count} drones LIVE"
