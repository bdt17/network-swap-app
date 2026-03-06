class DroneController < ApplicationController
  skip_before_action :verify_authenticity_token

  def inspect
    render json: {
      status: "operational",
      drone_id: params[:id],
      site: "Phoenix DC21 Rack 3U",
      battery: 87,
      issues: ["loose RJ45 rack 3U", "thermal alert switch B2", "dust filter clogged"],
      timestamp: Time.now.utc.iso8601
    }
  end

  def status
    render json: {fleet: "7/7 operational", avg_battery: 87, site: "Phoenix DC21"}
  end
end

  def launch_swarm
    ActionCable.server.broadcast "drone_fleet:phoenix_dc21", {
      drone_id: 'DJI-PHX-179',
      battery: 87,
      issues: ['loose RJ45 rack 3U', 'thermal alert B2', 'dust filter clogged'],
      status: 'swarm_launched',
      timestamp: Time.now.utc.iso8601
    }
    
    render json: {success: true, message: "🚀 Swarm launched - 7 drones inspecting Phoenix DC21"}
  end
