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
        location: {lat: 33.4484, lng: -112.0740},
        last_scan: "Rack 3U B2",
        thermal_alerts: 1
      },
      {
        id: 2,
        name: "DJI-PHX-225", 
        model: "Matrice 300 RTK",
        status: "idle",
        battery: 95,
        site: "Phoenix DC22",
        location: {lat: 33.5153, lng: -112.0518}
      }
    ]
  end

  def inspect
    render json: {
      id: params[:id],
      inspection: "complete",
      devices_scanned: 25,
      issues: [
        {rack: "3U B2", device: "#2001 Cisco 9300", status: "EOL"}
      ],
      timestamp: Time.now.utc.iso8601,
      pilot: "Smith,J"
    }
  end

  def diagnostics
    render json: {
      id: params[:id],
      battery: 87,
      cpu: 23.5,
      gps: {satellites: 14, fix: "3D"},
      sensors: {imu: "ok", compass: "calibrated"},
      camera: {thermal: "online", zoom: "20x"}
    }
  end
end
