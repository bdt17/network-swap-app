class DevicesController < ApplicationController
  protect_from_forgery except: :export  # Disable CSRF for API
  
  def index
    render json: {status: 'ok', devices: 2}
  end
  
  def show
    render json: {id: params[:id], status: 'green'}
  end
  
  def health
    render json: {device: params[:id], status: 'green', uptime: '99.9%'}
  end
  
  def export
    csv = "ID,Name,Status\n1,Cisco C9300,green\n2,Aruba AP,green"
    send_data csv, filename: 'devices.csv', type: 'text/csv'
  end
end
