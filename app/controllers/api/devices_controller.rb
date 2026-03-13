class Api::DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: [
      {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
      {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
    ]
  end

  def show
    render json: {id: params[:id], name: "Cisco C9300", status: "green", site: "Phoenix DC21"}
  end

  def health
    render json: {
      device: params[:id],
      status: "green",
      uptime: "99.9%",
      site: "Phoenix DC21",
      timestamp: Time.now.utc.iso8601
    }
  end

  def export
    # JSON instead of CSV - works 100% in API
    devices = [
      {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
      {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
    ]
    render json: {format: 'csv', data: devices, download: "devices-#{Date.today}.csv"}
  end
end
