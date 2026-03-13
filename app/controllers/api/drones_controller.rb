class Api::DronesController < ApplicationController
  def fleet
    render json: [
      {id: "DJI-001", status: "active", battery: 87, gps: "33.4484,-112.0740", firmware: "v1.2.3"},
      {id: "DJI-002", status: "standby", battery: 92, gps: "online", firmware: "v1.2.3"}
    ]
  end

  def inspect
    render json: {
      id: params[:id],
      status: "active",
      battery: 87,
      motors: "ok",
      gps: "33.4484,-112.0740",
      sensors: "nominal"
    }
  end

  def diagnostics
    render json: {
      id: params[:id],
      motors: "ok", gps: "ok", imu: "ok", 
      timestamp: Time.current.iso8601
    }
  end

  def swarm_status
    render json: {count: 2, status: "coordinated", leader: "DJI-001"}
  end
end
