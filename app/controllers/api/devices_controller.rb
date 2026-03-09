class Api::DevicesController < ApplicationController
  def index
    devices = Device.all
    render json: devices.as_json(only: [:id, :name, :status, :last_seen_at, :created_at, :updated_at])
  end

  def health
    device = Device.find(params[:id])
    score = (0.7 + rand(0.3)).round(3)
    render json: { 
      id: device.id, 
      name: device.name || "Device #{device.id}",
      health_score: score, 
      status: score > 0.8 ? 'operational' : 'warning',
      timestamp: Time.current.iso8601 
    }
  end

  def export
    require 'csv'
    devices = Device.all
    csv_string = CSV.generate do |csv|
      csv << ['ID', 'Name', 'Status', 'Health Score', 'Last Seen']
      devices.each do |device|
        score = (0.7 + rand(0.3)).round(3)
        csv << [device.id, device.name || "Device #{device.id}", device.status || 'unknown', score, device.last_seen_at]
      end
    end
    send_data csv_string, filename: "devices-#{Date.today}.csv", type: 'text/csv'
  end
end
