class Api::MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Devices
  def index
    render json: [
      {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
      {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
    ]
  end

  def show
    render json: {id: params[:id], name: "Cisco C9300", status: "green"}
  end

  def health
    render json: {
      device: params[:id],
      status: "green",
      uptime: "99.9%",
      site: "Phoenix DC21"
    }
  end

  def export
    render json: {
      format: 'csv',
      devices: [
        {id: 1, name: "Cisco C9300-Rack1U", status: "operational"},
        {id: 2, name: "Aruba AP-515", status: "active"}
      ]
    }
  end

  # Drones  
  def fleet
    render json: [
      {id: 1, name: "DJI-PHX-179", battery: 87, status: "scanning"},
      {id: 2, name: "DJI-PHX-225", battery: 95, status: "idle"}
    ]
  end

  def inspect
    render json: {id: params[:id], status: "inspection complete"}
  end

  def diagnostics
    render json: {id: params[:id], battery: 87, cpu: 23.5}
  end

  # Dispatch SMS
  def sms
    render json: {success: true, message: "SMS sent to #{params[:tech]}"}
  end

  # Health
  def show
    render json: {status: 'ok', timestamp: Time.now.utc.iso8601}
  end
end
