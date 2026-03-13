class Api::DronesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def fleet
    render json: [
      {id: 1, name: "DJI-PHX-179", battery: 87, status: "scanning"},
      {id: 2, name: "DJI-PHX-225", battery: 95, status: "idle"}
    ]
  end

  def control
    drone_id = params[:id] || "PHX-179"
    action = params[:action] || "status"
    render json: {
      drone: drone_id,
      action: action,
      status: "acknowledged",
      battery: 87,
      commands: ["pause", "resume", "land", "rtk"]
    }
  end
end
