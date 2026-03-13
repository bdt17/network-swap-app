class Api::MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: [
      {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
      {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
    ]
  end

  def show
    render json: { 
      status: 'healthy', 
      uptime: '99.9%', 
      timestamp: Time.now.utc.iso8601,
      devices: 247,
      drones: 2 
    }
  end

  def sms
    render json: { 
      success: true, 
      message: "SMS queued to #{params[:phone]}: #{params[:message]}",
      sid: "SM#{rand(10**10)}"
    }
  end

  def health
    render json: { status: 'healthy', timestamp: Time.now.utc.iso8601 }
  end

  def fleet
    render json: [
      {id: 1, name: "DJI-PHX-179", battery: 87, status: "scanning"},
      {id: 2, name: "DJI-PHX-225", battery: 95, status: "idle"}
    ]
  end

  def export
    render json: { format: 'csv', count: 247 }
  end
end
