class Api::MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: {devices: 247, drones: 2, sites: 14, swaps: 23}
  end

  def show
    render json: {status: 'healthy', devices: 247, timestamp: Time.now.utc.iso8601}
  end

  def sms
    render json: {success: true, sid: "SM#{rand(10**10)}", phone: params[:phone]}
  end

  def fleet
    render json: [
      {id: 1, name: "DJI-PHX-179", battery: 87, status: "scanning Phoenix DC21"},
      {id: 2, name: "DJI-PHX-225", battery: 95, status: "idle"}
    ]
  end

  def inspect
    render json: {id: params[:id], status: "inspection complete", firmware: "v2.1.3"}
  end

  def diagnostics
    render json: {id: params[:id], battery: 87, thermal_alerts: ["Rack 3UB2"]}
  end

  def export
    render json: {format: 'csv', count: 247, exported_at: Time.now.utc.iso8601}
  end

  def control
    render json: {id: params[:id], command: params[:command] || "resume", status: "executed"}
  end
end
