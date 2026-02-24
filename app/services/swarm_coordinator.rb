class SwarmCoordinator
  def initialize(fleet)
    @fleet = fleet
  end

  def execute_multi_site_diagnosis(sites)
    available_drones = @fleet.drones.active.online
    return { error: "No drones available" } if available_drones.empty?

    tasks = assign_drones_to_sites(available_drones, sites)
    
    results = tasks.map do |drone, site|
      DroneInspector.new(drone).perform_site_sweep(site)
    end

    { 
      status: "swarm_deployed", 
      assignments: tasks.length, 
      results: results 
    }
  end

  private

  def assign_drones_to_sites(drones, sites)
    drones.take(sites.length).zip(sites)
  end
end
