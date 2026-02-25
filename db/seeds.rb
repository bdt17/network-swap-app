Site.create!(name: 'Phoenix DC21', address: '123 Tech Dr, Phoenix AZ')
Site.create!(name: 'Phoenix HQ', address: '456 Network Blvd')
DroneFleet.create!(manufacturer: 'DJI', api_key: 'dji_phx_179_prod', status: 1, site_id: 1)
puts "✅ DJI-PHX-179 + Phoenix DC21 PRODUCTION READY"
