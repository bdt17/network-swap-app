class Api::DevicesController < Api::ApplicationController
  def index
    render json: { devices: 247, sites: 14 }
  end

  def show
    render json: { id: params[:id], status: 'green' }
  end

  def health
    render json: { device: params[:id], status: 'green', uptime: '99.9%' }
  end

  def export
    render json: { format: 'csv', count: 247 }
  end
end
