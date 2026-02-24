class DroneInspector
  attr_reader :drone

  def initialize(drone)
    @drone = drone
  end

  def perform_site_sweep(site)
    return { error: "Drone offline" } unless drone&.online?

    flight_plan = generate_flight_path(site)
    
    InspectionLog.create!(
      drone_fleet_id: drone.fleet_id,
      site_id: site.id,
      status: "mission_started",
      findings: flight_plan.to_json,
      created_at: Time.current
    )
    
    { status: "success", plan: flight_plan }
  end

  private

  def generate_flight_path(site)
    { 
      waypoints: [{lat: 33.4484, lng: -112.0740}], 
      altitude: 5.0, 
      speed: 2.0 
    }
  end
end
