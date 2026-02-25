# Thomas IT Phase 14: Drone Fleet Data
Site.create!([
  {name: 'Phoenix DC21', address: '123 Tech Dr, Phoenix AZ'},
  {name: 'Phoenix HQ', address: '456 Network Blvd'}
])

DroneFleet.create!([
  {manufacturer: 'DJI', api_key: 'dji_phx_179_mock', status: 1, site_id: 1},
  {manufacturer: 'DJI', api_key: 'dji_hq_22_mock', status: 1, site_id: 2}
])

puts "✅ Seeded: Phoenix DC21 + HQ sites + DJI-PHX-179 drone"
