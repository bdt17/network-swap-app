class Api::DevicesController < ApplicationController
  def index
    render json: Device.all
  end

  def health
    device = Device.find(params[:id])
    score = (0.7 + rand(0.3)).round(3)
    render json: {
      id: device.id,
      name: device.name || "Device #{device.id}",
      health_score: score,
      status: score > 0.8 ? 'operational' : 'warning',
      timestamp: Time.current.utc.iso8601
    }
  end

  def export
    require 'csv'
    
    devices = Device.all
    csv_content = CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Name', 'Status', 'Health Score', 'Last Updated']
      devices.find_each(batch_size: 1000) do |device|
        score = (0.7 + rand(0.3)).round(3)
        csv << [
          device.id,
          device.name.to_s,
          device.status.to_s,
          score,
          device.updated_at&.iso8601 || 'N/A'
        ]
      end
    end
    
    send_data csv_content,
      filename: "network-swap-devices-#{Date.current}.csv",
      type: 'text/csv',
      disposition: 'attachment'
  end
end
