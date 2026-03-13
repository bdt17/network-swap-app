class Api::MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: {devices: 247, drones: 2, sites: 14, swaps: 23}
  end

  def show
    render json: {status: 'healthy', app_id: 180694, timestamp: Time.now.utc.iso8601}
  end

  def health
    render json: {status: 'healthy', app_id: 180694}
  end

  def fleet
    render json: [
      {id: "DJI-PHX-179", battery: 87, status: "scanning Phoenix DC21", app_id: 180694},
      {id: "DJI-PHX-225", battery: 95, status: "idle", app_id: 180694}
    ]
  end

  def inspect
    render json: {id: params[:id], status: "inspection complete", app_id: 180694}
  end

  def control
    render json: {id: params[:id], command: params[:command] || "resume", status: "executed", app_id: 180694}
  end

  def export
    render json: {format: 'csv', count: 247, app_id: 180694}
  end

  def sms
    render json: {success: true, sid: "SM#{rand(10**10)}", app_id: 180694}
  end
end
