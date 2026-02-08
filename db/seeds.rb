500.times do |i|
  Device.create!(
    name: "SW-#{i+1}",
    model: ["Cisco 2960", "Aruba AP-515", "HP Printer", "Ubiquiti U6"][rand(4)],
    site: ["Phoenix HQ", "Site 2", "Site 3", "Remote"][rand(4)],
    eos_date: rand(180..800).days.from_now,
    status: "active"
  )
end
