class StatusController < ApplicationController
  def index
    render json: {
      site: Site.last&.name,
      drones_online: Drone.where(status: 'online').count,
      eol_devices: Device.where(status: 'EOL').count,
      battery: Drone.where(status: 'online').first&.battery_level,
      timestamp: Time.current
    }
  end
end
