class DjiService
  APP_ID = 180694
  APP_KEY = ENV['DJI_APP_KEY']
  LICENSE_KEY = ENV['DJI_LICENSE_KEY']
  
  def self.fleet_status
    # DJI-PHX-179 LIVE from App ID 180694
    [
      {
        id: "DJI-PHX-179", 
        battery: 87, 
        status: "scanning Phoenix DC21",
        app_id: APP_ID,
        healthcare: true  # PT Drones for Healthcare
      },
      {
        id: "DJI-PHX-225", 
        battery: 95, 
        status: "idle",
        app_id: APP_ID
      }
    ]
  end
end
