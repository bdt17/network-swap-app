# Only run if drones present
if Rails.env.production? && ENV['RENDER_EXTERNAL_URL']
  every 5.minutes do
    rake "drones:heartbeat" # Safe if missing
  end
end
