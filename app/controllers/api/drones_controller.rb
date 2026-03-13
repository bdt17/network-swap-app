class Api::DronesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def fleet
    render json: [
      {
        id: 1,
        name: "DJI-PHX-179", 
        model: "Mavic 3 Enterprise",
        status: "scanning",
        battery: 87,
        site: "Phoenix DC21",
        location: {lat: 33.4484, lng: -112.0740}
      },
      {
        id: 2,
        name: "DJI-PHX-225", 
        model: "Matrice 300 RTK",
        status: "idle",
        battery: 95,
        site: "Phoenix DC22"
      }
    ]
  end

  def inspect
    render json: {
      id: params[:id],
      inspection: "complete",
      devices_scanned: 25,
      issues: ["Rack 3U B2: Cisco 9300 EOL"],
      pilot: "Smith,J"
    }
  end

  def diagnostics
    render json: {
      id: params[:id],
      battery: 87,
      cpu: 23.5,
      gps: {satellites: 14, fix: "3D"},
      sensors: {imu: "ok", compass: "calibrated"}
    }
  end
end
