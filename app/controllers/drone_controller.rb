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
    render json: {
      fleet: "7/7 operational",
      avg_battery: 87,
      site: "Phoenix DC21",
      timestamp: Time.now.utc.iso8601
    }
  end
end
