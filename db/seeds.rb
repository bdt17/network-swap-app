Site.create!([
  {name: 'Thomas IT HQ', address: 'Phoenix, AZ', timezone: 'MST'},
  {name: 'Pfizer Site-42', address: 'New Jersey Pharma', timezone: 'EST'},
  {name: 'FDA Lab DC', address: 'Washington DC', timezone: 'EST'}
])

Site.all.each.with_index do |site, site_idx|
  15.times do |i|
    mac_num = (site_idx * 15) + i + 1
    Device.create!(
      mac_address: "00:1A:2B:3C:4D:#{format('%02d', mac_num)}",
      model: ['Cisco Catalyst-9300', 'Aruba 6300', 'Juniper EX4650', 'Cisco Meraki'][rand(4)],
      site: site,
      status: ['active', 'maintenance', 'eol'][rand(3)],
      warranty_expires: rand(30..730).days.from_now
    )
  end
end
