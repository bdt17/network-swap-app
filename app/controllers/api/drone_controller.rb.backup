class Api::DroneController < ApplicationController
  def inspect
    result = DroneInspector.new(site_id: params[:site_id], swap_ticket_id: params[:swap_ticket_id]).diagnose_network
    render json: {
      success: true,
      findings: result,
      drone_status: 'inspection_complete',
      video_feed: "rtmp://drone-feed.thomasit.com/phx-dc21"
    }, status: :created
  end
  
  def status
    render json: {
      drones_ready: DroneFleet.where(status: 0).count,
      site: 'Phoenix DC21',
      status: 'operational'
    }
  end
end
