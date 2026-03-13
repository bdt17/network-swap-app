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
      site: "Phoenix DC21"
    }
  end

  def export
    render json: {
      format: 'csv',
      devices: [
        {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
        {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
      ],
      filename: "devices-#{Date.today}.csv"
    }
  end
end
