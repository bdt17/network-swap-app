class Api::DevicesController < ApplicationController
  def index
    render json: Device.all
  end

  def health
    device = Device.find(params[:id])
    score = (0.7 + rand(0.3)).round(3)
    render json: { 
      id: device.id, 
      name: device.name, 
      health_score: score, 
      status: score > 0.8 ? 'operational' : 'warning'
    }
  end

  def export
    require 'csv'
    devices = Device.all
    csv = CSV.generate do |csv|
      csv << ['ID', 'Name', 'Health Score']
      devices.each { |d| csv << [d.id, d.name, rand.round(2)] }
    end
    send_data csv, filename: 'devices.csv', type: 'text/csv'
  end
end
