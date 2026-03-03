class StatusController < ApplicationController
  def index
    @json_data = {
      site: Site.last&.name,
      drones_online: Drone.where(status: 'online').count,
      eol_devices: Device.where(status: 'EOL').count,
      battery: Drone.where(status: 'online').first&.battery_level,
      total_devices: Device.count,
      timestamp: Time.current.iso8601
    }.to_json.html_safe
  end
  
  def dispatch_sms
    eol_device = Device.where(status: 'EOL').first
    message = "🚨 AI SWAP ALERT\n#{eol_device&.name || 'Critical device'} EOL detected\nPhoenix DC21 - Rack3U\nDispatch Smith,J. ASAP?"
    
    render json: { 
      message: "AI dispatched Smith,J. (Tech #1)",
      device: eol_device&.name,
      rack: 'Rack3U',
      site: Site.last&.name,
      mock_sms: message,
      success: true
    }
  end
end
