class DevicesController < ApplicationController
  def index
    render json: { count: Device.count, status: "operational" }
  end
  
  def health
    render json: { 
      device_id: params[:id], 
      status: "healthy", 
      timestamp: Time.now 
    }
  end
  
  def export
    csv = "name,status,site_id\n"
    Device.limit(10).each do |d|
      csv += "\"#{d.name}\",\"#{d.status}\",#{d.site_id}\n"
    end
    render plain: csv, content_type: 'text/csv'
  end
end
