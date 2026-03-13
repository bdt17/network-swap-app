class Api::DronesController < ApplicationController
  def fleet
    render json: [
      {id: "DJI-001", status: "active", battery: 87, gps: "33.4484,-112.0740"},
      {id: "DJI-002", status: "standby", battery: 92}
    ]
  end

  def inspect
    render json: {id: params[:id], battery: 87, motors: "ok", gps: "live"}
  end

  def diagnostics
    render json: {id: params[:id], all_systems: "nominal"}
  end

  def swarm_status
    render json: {count: 2, status: "ready", leader: "DJI-001"}
  end
end
