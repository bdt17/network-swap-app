class Api::DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: { 
      count: Device.count || 247, 
      status: "operational",
      devices: Device.limit(5).pluck(:id, :name, :status)
    }
  end
  
  def health
    render json: { 
      device_id: params[:id], 
      status: "healthy", 
      temperature: "32°C",
      timestamp: Time.now.iso8601
    }
  end
end
