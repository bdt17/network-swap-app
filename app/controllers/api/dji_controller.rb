class Api::DjiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def telemetry
    render json: {
      drone_id: "DJI-PHX-179",
      battery: 87,
      status: "scanning_rack_3u",
      gps: { lat: 33.4484, lng: -112.0740 }, # Phoenix DC21
      rack_temp: 42, # Rack 3U-B2 thermal alert
      devices_scanned: 25,
      mission: "phx_dc21_inventory",
      timestamp: Time.current.iso8601,
      phase: "14_LIVE"
    }
  end
end
