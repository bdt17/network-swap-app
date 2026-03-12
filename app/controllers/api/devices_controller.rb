class Api::DevicesController < ApplicationController
  def index
    render plain: "API Devices: 128 active, 99.9% uptime"
  end
  
  def show
    render plain: "API Device ##{params[:id]}"
  end
  
  def health
    render plain: "API Device #{params[:id]}: HEALTHY"
  end
end
