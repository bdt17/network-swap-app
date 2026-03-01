class Api::DroneController < ApplicationController
  # 🚁 PHASE 14: Launch drone swarm for EOL swap prep
  def launch_swarm
    result = SwarmCoordinator.launch_swarm!(
      params[:site_id].to_i,
      tasks: Array(params[:tasks]).map(&:to_s)
    )
    render json: { 
      ok: true, 
      **result 
    }, status: :created
  end

  # 🩺 Existing: Network diagnostics (preserved)
  def inspect
    result = DroneInspector.new(
      site_id: params[:site_id], 
      swap_ticket_id: params[:swap_ticket_id]
    ).diagnose_network
    
    render json: {
      success: true,
      findings: result,
      drone_status: 'inspection_complete',
      video_feed: "rtmp://drone-feed.thomasit.com/phx-dc21"
    }, status: :created
  end

  # 📊 Existing: Fleet status (preserved)
  def status
    render json: {
      drones_ready: DroneFleet.where(status: 0).count,
      site: 'Phoenix DC21',
      status: 'operational'
    }
  end
end
