# DJI-PHX-179 (Field Active)
Drone.create!(
  serial_number: "DJI-PHX-179", 
  app_id: 180694,
  battery: 87,
  status: "scanning Phoenix DC21",
  location: "PHX-DC21-Aisle-7"
)

# Field Tech Smith,J.
FieldTech.create!(
  name: "Smith,J.", 
  email: "smith@thomasit.com",
  latitude: 33.4484, 
  longitude: -112.0740,
  status: "active"
)

puts "✅ Seeded: DJI-PHX-179 + Smith,J. (247 devices ready)"
