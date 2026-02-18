puts "🌱 Seeding Thomas IT Network Swap App (Phase 4-7)..."

# Admin user
User.find_or_create_by!(email: 'admin@thomasit.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Test sites (if missing)
Site.find_or_create_by!(name: 'Phoenix HQ', code: 'PHX')
Site.find_or_create_by!(name: 'Mesa DC', code: 'MES')

# Test devices (leverage existing schema)
Device.transaction do
  25.times do |i|
    Device.find_or_create_by!(name: "PHX-SW-#{i+1}") do |device|
      device.model = 'Cisco Catalyst 9300'
      device.eol_date = 45.days.from_now
      device.site = Site.first
      device.status = 'active'
      device.vendor = 'Cisco'
    end
  end
end

puts "✅ Seeded #{User.count} users, #{Device.count} devices!"
